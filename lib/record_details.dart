import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_logger_viewer/level_extensions.dart';
import 'package:the_logger_viewer/models.dart';

/// Record details widget.
class RecordDetails extends StatelessWidget {
  /// Default constructor.
  const RecordDetails({required this.record, super.key});

  /// LogFile record.
  final LogFileRecord record;

  @override
  Widget build(BuildContext context) {
    // return Stack(
    // fit: StackFit.expand,
    // children: [
    // return
    // ColoredBox(
    // color: record.level.color.withOpacity(0.4),
    // child:
    // return SelectionArea(
    // child:
    return SingleChildScrollView(
      child: Table(
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
        },
        children: [
          _row(
            'Session id',
            record.sessionId.toString(),
          ),
          _row(
            'Id',
            record.id.toString(),
          ),
          _row(
            'Timestamp',
            '${record.recordTimestamp} (${record.time})',
          ),
          _row(
            'Logger name',
            record.loggerName,
          ),
          _row(
            'Level',
            record.level.name.toLowerCase(),
          ),
          _row(
            'Message',
            record.message,
          ),
          if (record.error != null)
            _row(
              'Error',
              record.error!,
            ),
          if (record.stackTrace != null)
            _row(
              'Stack trace',
              record.stackTrace!,
            ),
        ],
      ),
      // ),
      // ),
      // ),
      // Align(
      // alignment: Alignment.topRight,
      // child: IconButton(
      // onPressed: _onCopy,
      // icon: const Icon(Icons.copy),
      // tooltip: 'Copy to clipboard',
      // ),
      // ),
      // ],
    );
  }

  TableRow _row(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TableCell(
            child: Text('$label '),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TableCell(
            child: Text('$value '),
          ),
        ),
      ],
    );
  }

  void _onCopy() {
    final encoder = JsonEncoder.withIndent(' ' * 2);
    final encoded = encoder.convert(record.toJson());

    Clipboard.setData(
      ClipboardData(
        text: encoded,
      ),
    );
  }
}
