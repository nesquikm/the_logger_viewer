import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (details) {
        _dropDone(details);
      },
      child: Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
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
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please drop only one file'),
      ));
      return;
    }

    final file = details.files.first;
    final bytes = await file.readAsBytes();
    _decodeBytes(bytes);
  }

  Future<void> _openFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Open a log file',
      type: FileType.custom,
      allowedExtensions: ['bz2'],
      lockParentWindow: true,
    );

    if (result != null) {
      _readFile(result);
    } else {
      // User canceled the picker
    }
  }

  Future<void> _readFile(FilePickerResult result) async {
    if (result.files.single.bytes != null) {
      _decodeBytes(result.files.single.bytes!);
    } else {
      final file = File(result.files.single.path!);
      final randomAccessFile = file.openSync();
      final length = randomAccessFile.lengthSync();
      final bytes = randomAccessFile.readSync(length);
      _decodeBytes(bytes);
      randomAccessFile.closeSync();
    }
  }

  Future<void> _decodeBytes(Uint8List bytes) async {
    // Decode the bytes
    print('File length: ${bytes.length}');
  }
}
