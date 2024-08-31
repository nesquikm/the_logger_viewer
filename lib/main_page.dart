import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_logger_viewer/models.dart';

/// Main application Page
class MainPage extends StatefulWidget {
  /// Default constructor.
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dropDone(DropDoneDetails details) async {
    if (details.files.length != 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please drop only one file'),
        ),
      );
      return;
    }

    final file = details.files.first;
    final bytes = await file.readAsBytes();
    await _decodeBytes(bytes);
  }

  Future<void> _openFile() async {
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Open a log file',
      type: FileType.custom,
      allowedExtensions: ['bz2'],
      lockParentWindow: true,
    );

    if (result != null) {
      await _readFile(result);
    } else {
      // User canceled the picker
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
    final decoder = BZip2Decoder();
    final decodedBytes = decoder.decodeBytes(bytes);
    final decodedString = utf8.decode(decodedBytes);

    await _readJson(decodedString);
  }

  Future<void> _readJson(String string) async {
    final json = jsonDecode(string) as Map<String, Object?>;
    final logFile = LogFile.fromJson(json);
    print(logFile);
  }
}
