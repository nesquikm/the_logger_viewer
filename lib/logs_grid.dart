import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:the_logger_viewer/colors.dart';
import 'package:the_logger_viewer/models.dart';

/// Logs grid widget.
class LogsGrid extends StatefulWidget {
  /// Default constructor.
  const LogsGrid({
    required this.logFile,
    required this.onRecordSelected,
    super.key,
  });

  /// Log file to display.
  final LogFile logFile;

  /// Callback when record is selected.
  final void Function(int id) onRecordSelected;

  static final List<PlutoColumn> _columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Session',
      field: 'sessionId',
      readOnly: true,
      enableSorting: false,
      width: 90,
      minWidth: 90,
      type: PlutoColumnType.number(
        format: '###',
      ),
    ),
    PlutoColumn(
      title: 'Id',
      field: 'id',
      readOnly: true,
      width: 90,
      minWidth: 90,
      type: PlutoColumnType.number(
        format: '###',
      ),
    ),
    PlutoColumn(
      title: 'Timestamp',
      field: 'record_timestamp',
      readOnly: true,
      enableSorting: false,
      width: 180,
      minWidth: 100,
      type: PlutoColumnType.date(format: 'yyyy-MM-dd HH:mm:ss'),
    ),
    PlutoColumn(
      title: 'Logger name',
      field: 'loggerName',
      readOnly: true,
      enableSorting: false,
      width: 250,
      minWidth: 100,
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Level',
      field: 'level',
      readOnly: true,
      enableSorting: false,
      width: 100,
      minWidth: 100,
      type: PlutoColumnType.select(Level.LEVELS),
      renderer: (rendererContext) {
        final level = rendererContext.cell.value as Level;
        return Text(
          level.name.toLowerCase(),
          style: TextStyle(
            color: level.color,
          ),
        );
      },
    ),
    PlutoColumn(
      title: 'Message',
      field: 'message',
      readOnly: true,
      enableSorting: false,
      width: 250,
      minWidth: 100,
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Error',
      field: 'error',
      readOnly: true,
      enableSorting: false,
      width: 250,
      minWidth: 100,
      type: PlutoColumnType.text(),
    ),
  ];

  @override
  State<LogsGrid> createState() => _LogsGridState();
}

class _LogsGridState extends State<LogsGrid> {
  late final PlutoGridStateManager _stateManager;

  @override
  Widget build(BuildContext context) {
    final rows = widget.logFile.logs
        .map(
          (record) => PlutoRow(
            cells: {
              'sessionId': PlutoCell(value: record.sessionId),
              'id': PlutoCell(value: record.id),
              'record_timestamp': PlutoCell(value: record.recordTimestamp),
              'loggerName': PlutoCell(value: record.loggerName),
              'level': PlutoCell(value: record.level),
              'message': PlutoCell(value: record.message),
              'error': PlutoCell(value: record.error ?? ''),
            },
          ),
        )
        .toList();

    return PlutoGrid(
      columns: LogsGrid._columns,
      rows: rows,
      mode: PlutoGridMode.selectWithOneTap,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        _stateManager = event.stateManager;
      },
      onSelected: (PlutoGridOnSelectedEvent event) {
        final row = event.row;
        final id = row!.cells['id']!.value as int;
        widget.onRecordSelected(id);
      },
      configuration: const PlutoGridConfiguration(),
      rowColorCallback: (rowColorContext) {
        final level = rowColorContext.row.cells['level']!.value as Level;
        final foregroundColor = level.color.withOpacity(0.4);
        final backgroundColor = rowColorContext.rowIdx.isEven
            ? Colors.transparent
            : Colors.grey.withOpacity(0.1);
        return Color.alphaBlend(foregroundColor, backgroundColor);
      },
    );
  }
}
