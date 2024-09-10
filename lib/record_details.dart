import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_logger_viewer/level_extensions.dart';
import 'package:the_logger_viewer/models.dart';
import 'package:the_logger_viewer/text_extensions.dart';

/// Record details widget.
class RecordDetails extends StatelessWidget {
  /// Default constructor.
  const RecordDetails({
    required this.record,
    required this.filterValues,
    super.key,
  });

  /// LogFile record.
  final LogFileRecord record;

  /// Filter values.
  final Map<Fields, String> filterValues;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(
          color: record.level.color.withOpacity(0.4),
          child: SingleChildScrollView(
            child: SelectionArea(
              child: Table(
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                },
                children: [
                  _row(
                    Fields.sessionId.displayName,
                    record.sessionId.toString(),
                  ),
                  _row(
                    Fields.id.displayName,
                    record.id.toString(),
                  ),
                  _row(
                    Fields.recordTimestamp.displayName,
                    '${record.recordTimestamp} (${record.time})',
                  ),
                  _row(
                    Fields.loggerName.displayName,
                    record.loggerName,
                    highlight: filterValues[Fields.loggerName],
                  ),
                  _row(
                    Fields.level.displayName,
                    record.level.name.toLowerCase(),
                  ),
                  if (record.hasFormattedMessage)
                    _row(
                      'Formatted ${Fields.message.displayName.toLowerCase()}',
                      record.formattedMessage,
                      highlight: filterValues[Fields.message],
                    ),
                  _row(
                    Fields.message.displayName,
                    record.message,
                    highlight: filterValues[Fields.message],
                  ),
                  if (record.hasFormattedError)
                    _row(
                      'Formatted ${Fields.error.displayName.toLowerCase()}',
                      record.formattedError!,
                      highlight: filterValues[Fields.error],
                    ),
                  if (record.error != null)
                    _row(
                      Fields.error.displayName,
                      record.error!,
                      highlight: filterValues[Fields.error],
                    ),
                  if (record.stackTrace != null)
                    _row(
                      Fields.stackTrace.displayName,
                      record.stackTrace!,
                    ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: _onCopy,
            icon: const Icon(Icons.copy),
            tooltip: 'Copy to clipboard',
          ),
        ),
      ],
    );
  }

  TableRow _row(
    String label,
    String value, {
    String? highlight,
  }) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text('$label '),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text('$value ').highlightSubstring(highlight),
        ),
      ],
    );
  }

  void _onCopy() {
    Clipboard.setData(
      ClipboardData(
        text: record.toFormattedString(),
      ),
    );
  }
}
