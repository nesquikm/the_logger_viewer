import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:the_logger_viewer/level_extensions.dart';
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

  @override
  State<LogsGrid> createState() => _LogsGridState();
}

class _LogsGridState extends State<LogsGrid> {
  PlutoGridStateManager? _stateManager;

  static final List<PlutoColumn> _columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Session',
      field: 'sessionId',
      readOnly: true,
      enableSorting: false,
      suppressedAutoSize: true,
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
      suppressedAutoSize: true,
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
      suppressedAutoSize: true,
      enableSorting: false,
      width: 180,
      minWidth: 100,
      type: PlutoColumnType.date(format: 'yyyy-MM-dd HH:mm:ss'),
    ),
    PlutoColumn(
      title: 'Logger name',
      field: 'loggerName',
      readOnly: true,
      suppressedAutoSize: true,
      enableSorting: false,
      width: 250,
      minWidth: 100,
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Level',
      field: 'level',
      readOnly: true,
      suppressedAutoSize: true,
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

  List<PlutoRow<LogFileRecord>> _rows = [];

  @override
  void initState() {
    super.initState();

    _updateRows();
  }

  @override
  void didUpdateWidget(covariant LogsGrid oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.logFile != oldWidget.logFile) {
      _updateRows();
    }
  }

  void _updateRows() {
    _stateManager?.removeAllRows();

    _rows = widget.logFile.logs
        .map(
          (record) => PlutoRow<LogFileRecord>(
            data: record,
            cells: {
              'sessionId': PlutoCell(value: record.sessionId),
              'id': PlutoCell(value: record.id),
              'record_timestamp': PlutoCell(value: record.recordTimestamp),
              'loggerName': PlutoCell(value: record.loggerName),
              'level': PlutoCell(value: record.level),
              'message': PlutoCell(
                value: record.message.replaceAll('\n', ' ').trim(),
              ),
              'error': PlutoCell(
                value: record.error?.replaceAll('\n', ' ').trim() ?? '',
              ),
            },
          ),
        )
        .toList();

    _stateManager?.appendRows(_rows);

    _scrollToBottom();
  }

  void _scrollToBottom() {
    _stateManager?.moveScrollByRow(
      PlutoMoveDirection.down,
      _stateManager!.refRows.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: _columns,
      rows: _rows,
      mode: PlutoGridMode.selectWithOneTap,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        _stateManager = event.stateManager;
        event.stateManager.setShowColumnFilter(true);
        _scrollToBottom();
      },
      onSelected: (PlutoGridOnSelectedEvent event) {
        final row = event.row;
        final record = row!.data as LogFileRecord;
        widget.onRecordSelected(record.id);
      },
      configuration: PlutoGridConfiguration(
        columnSize: const PlutoGridColumnSizeConfig(
          autoSizeMode: PlutoAutoSizeMode.scale,
        ),
        columnFilter: PlutoGridColumnFilterConfig(
          filters: [
            ...FilterHelper.defaultFilters,
            LevelFilter(),
          ],
          resolveDefaultColumnFilter: (column, resolver) {
            // switch (column.field) {
            //   case 'level':
            //     return resolver<LevelFilter>() as PlutoFilterType;
            // }
            return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
          },
        ),
      ),
      rowColorCallback: (rowColorContext) {
        final record = rowColorContext.row.data as LogFileRecord;
        final foregroundColor = record.level.color.withOpacity(0.4);
        final backgroundColor = rowColorContext.rowIdx.isEven
            ? Colors.transparent
            : Colors.grey.withOpacity(0.1);
        return Color.alphaBlend(foregroundColor, backgroundColor);
      },
    );
  }
}

/// Level filter.
class LevelFilter extends PlutoFilterType {
  @override
  String get title => '=>';

  @override
  PlutoCompareFunction get compare => ({
        required String? base,
        required String? search,
        required PlutoColumn column,
      }) {
        final searchLevel = LevelExtensions.fromString(search ?? '');

        return true;
      };
}
