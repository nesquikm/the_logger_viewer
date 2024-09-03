import 'dart:convert';
import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:the_logger_viewer/area_id.dart';
import 'package:the_logger_viewer/intro.dart';
import 'package:the_logger_viewer/logs_grid.dart';
import 'package:the_logger_viewer/models.dart';
import 'package:the_logger_viewer/record_details.dart';

/// Main application Page
class MainPage extends StatefulWidget {
  /// Default constructor.
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _log = Logger('_MainPageState');

  LogFile? _logFile;
  LogFileRecord? _selectedRecord;

  final _multiSplitViewcontroller = MultiSplitViewController(
    areas: [
      Area(
        flex: 4,
        data: AreaId.main,
      ),
      Area(
        data: AreaId.details,
      ),
    ],
  );

  late final LogsGridController _logsGridController;

  @override
  void initState() {
    super.initState();
    _logsGridController = LogsGridController(
      onRecordSelected: _onRecordSelected,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: _dropDone,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('TheLogger viewer'),
          actions: [
            IconButton(
              icon: const Icon(Icons.first_page),
              tooltip: 'Previous session',
              onPressed: _logsGridController.toFirstSession,
            ),
            IconButton(
              icon: const Icon(Icons.skip_previous),
              tooltip: 'Previous session',
              onPressed: _logsGridController.toPrevSession,
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              tooltip: 'Next session',
              onPressed: _logsGridController.toNextSession,
            ),
            IconButton(
              icon: const Icon(Icons.last_page),
              tooltip: 'Last session',
              onPressed: _logsGridController.toLastSession,
            ),
            IconButton(
              icon: const Icon(Icons.file_open),
              tooltip: 'Open file',
              onPressed: _onOpenFile,
            ),
          ],
        ),
        body: MultiSplitViewTheme(
          data: MultiSplitViewThemeData(
            dividerPainter: DividerPainters.grooved1(
              size: 50,
              highlightedSize: 150,
              color: Theme.of(context).primaryColorLight,
              highlightedColor: Theme.of(context).primaryColor,
            ),
          ),
          child: MultiSplitView(
            axis: Axis.vertical,
            controller: _multiSplitViewcontroller,
            builder: (context, area) => switch (area.data) {
              AreaId.main => _logFile == null
                  ? const Intro(
                      areaId: AreaId.main,
                    )
                  : LogsGrid(
                      logFile: _logFile!,
                      controller: _logsGridController,
                    ),
              AreaId.details => _selectedRecord == null
                  ? const Intro(
                      areaId: AreaId.details,
                    )
                  : RecordDetails(record: _selectedRecord!),
              _ => throw UnimplementedError(),
            },
          ),
        ),
      ),
    );
  }

  Future<void> _dropDone(DropDoneDetails details) async {
    if (details.files.length != 1) {
      _showError('Please drop only one file');
      return;
    }

    final file = details.files.first;
    final bytes = await file.readAsBytes();
    await _decodeBytes(bytes);
  }

  Future<void> _onOpenFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Open a log file',
        type: FileType.custom,
        allowedExtensions: ['json'],
        lockParentWindow: true,
      );

      if (result != null) {
        await _readFile(result);
      } else {
        // User canceled the picker
      }
    } on Exception catch (e, s) {
      _showError('Filed to open file', e, s);
    }
  }

  Future<void> _readFile(FilePickerResult result) async {
    if (result.files.single.bytes != null) {
      await _decodeBytes(result.files.single.bytes!);
    } else {
      final file = File(result.files.single.path!);
      final randomAccessFile = file.openSync();
      final length = randomAccessFile.lengthSync();
      final bytes = randomAccessFile.readSync(length);
      await _decodeBytes(bytes);
      randomAccessFile.closeSync();
    }
  }

  Future<void> _decodeBytes(Uint8List bytes) async {
    try {
      // TODO(nesquikm): bz2 decoder seems to be broken :(
      // _log.fine('Decoding bytes, length: ${bytes.length}');
      // final decoder = BZip2Decoder();
      // final decodedBytes = decoder.decodeBytes(bytes);
      // _log.fine('Decoded bytes, length: ${decodedBytes.length}');

      // final decodedString = utf8.decode(decodedBytes);

      // _log.fine('Decoded string, length: ${decodedString.length}');

      // await _readJson(decodedString);

      // TODO(nesquikm): so let's use unpacked file for now
      final decodedString = utf8.decode(bytes);
      await _readJson(decodedString);
    } on Exception catch (e, s) {
      _showError('Failed to decode file', e, s);
    }
  }

  Future<void> _readJson(String string) async {
    final json = jsonDecode(string) as Map<String, Object?>;
    setState(() {
      _logFile = LogFile.fromJson(json);
      _selectedRecord = null;
    });
    _showMessage('Log file loaded, entries: ${_logFile!.logs.length}');
  }

  void _showSnack(String message) {
    if (!mounted) {
      _log.warning('Showing error on unmounted widget: $message');
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showMessage(String message) {
    _log.info(message);
    _showSnack(message);
  }

  void _showError(String message, [Object? error, StackTrace? stackTrace]) {
    _log.severe(message, error, stackTrace);
    _showSnack('$message $error');
  }

  void _onRecordSelected(LogFileRecord record) {
    setState(() {
      _selectedRecord = record;
    });
  }
}
