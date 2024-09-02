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

  final _controller = MultiSplitViewController(
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
              icon: const Icon(Icons.file_open),
              tooltip: 'Open file',
              onPressed: _openFile,
            ),
          ],
        ),
        body: MultiSplitView(
          axis: Axis.vertical,
          controller: _controller,
          builder: (context, area) => switch (area.data) {
            AreaId.main => _logFile == null
                ? const Intro(
                    areaId: AreaId.main,
                  )
                : LogsGrid(
                    logFile: _logFile!,
                    onRecordSelected: _onRecordSelected,
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

  Future<void> _openFile() async {
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

  void _onRecordSelected(int id) {
    try {
      setState(() {
        _selectedRecord = _logFile!.logs.firstWhere((r) => r.id == id);
      });
    } on Exception catch (e, s) {
      _showError('Filed find record', e, s);
    }
  }
}
