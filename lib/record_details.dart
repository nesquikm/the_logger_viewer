import 'package:flutter/material.dart';
import 'package:the_logger_viewer/models.dart';

/// Record details widget.
class RecordDetails extends StatelessWidget {
  /// Default constructor.
  const RecordDetails({required this.record, super.key});

  /// LogFile record.
  final LogFileRecord record;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Logger name: ${record.loggerName}'),
          Text('Id: ${record.id}'),
          Text('Record timestamp: ${record.recordTimestamp}'),
          Text('Session id: ${record.sessionId}'),
          Text('Level: ${record.level}'),
          Text('Message: ${record.message}'),
          if (record.error != null) Text('Error: ${record.error}'),
          if (record.stackTrace != null)
            Text('Stack trace: ${record.stackTrace}'),
          Text('Time: ${record.time}'),
        ],
      ),
    );
  }
}
