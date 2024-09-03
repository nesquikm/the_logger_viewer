import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:the_logger_viewer/level_extensions.dart';
import 'package:the_logger_viewer/models.dart';

/// Logs grid widget.
class LogsGrid extends StatefulWidget {
  /// Default constructor.
  const LogsGrid({
    required this.logFile,
    required this.controller,
    super.key,
  });

  /// Log file to display.
  final LogFile logFile;

  /// Logs grid controller.
  final LogsGridController controller;

  @override
  State<LogsGrid> createState() => _LogsGridState();
}

class _LogsGridState extends State<LogsGrid> {
  PlutoGridStateManager? _stateManager;

  late final List<PlutoColumn> _columns;
  List<PlutoRow<LogFileRecord>> _rows = [];

  final levelFilderController = MultiSelectController<Level>();

  @override
  void initState() {
    super.initState();

    _initColumns();
    _updateRows();

    widget.controller.toFirstSession = _toFirstSession;
    widget.controller.toPrevSession = _toPrevSession;
    widget.controller.toNextSession = _toNextSession;
    widget.controller.toLastSession = _toLastSession;
  }

  @override
  void didUpdateWidget(covariant LogsGrid oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.logFile != oldWidget.logFile) {
      _updateRows();
    }
  }

  void _initColumns() {
    _columns = <PlutoColumn>[
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
        width: 130,
        minWidth: 130,
        type: PlutoColumnType.select(Level.LEVELS),
        renderer: _levelColumnRenderer,
        filterWidget: _levelColumnWidget(),
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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _levelFilterCheck();
        });
        // _levelFilterCheck();
        _scrollToBottom();
      },
      onSelected: (PlutoGridOnSelectedEvent event) {
        final row = event.row;
        final record = row!.data as LogFileRecord;
        widget.controller.onRecordSelected(record);
      },
      configuration: PlutoGridConfiguration(
        columnSize: const PlutoGridColumnSizeConfig(
          autoSizeMode: PlutoAutoSizeMode.scale,
        ),
        columnFilter: PlutoGridColumnFilterConfig(
          filters: [
            ...FilterHelper.defaultFilters,
            // LevelFilter(),
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

  Widget _levelColumnRenderer(PlutoColumnRendererContext rendererContext) {
    {
      final level = rendererContext.cell.value as Level;
      return Text(
        level.name.toLowerCase(),
        style: TextStyle(
          color: level.color,
        ),
      );
    }
  }

  List<Level> _prevLevelsFilter = [];

  void _levelFilterCheck() {
    List<PlutoRow<dynamic>> rows;
    final foundFilterRows = _stateManager!.filterRowsByField('level');

    final filteredValues =
        levelFilderController.selectedItems.map((i) => i.value).toList();

    if (filteredValues.contains(Level.ALL) && filteredValues.length > 1) {
      if (_prevLevelsFilter.contains(Level.ALL)) {
        filteredValues.removeWhere((l) => l == Level.ALL);
      } else {
        filteredValues.removeWhere((l) => l != Level.ALL);
      }

      levelFilderController
          .unselectWhere((item) => !filteredValues.contains(item.value));
    } else if (filteredValues.isEmpty) {
      filteredValues.add(Level.ALL);
      levelFilderController.selectWhere((item) => item.value == Level.ALL);
    }

    _prevLevelsFilter = filteredValues;

    final filteredLevelsJson =
        jsonEncode(LogFileRecordLevels(levels: filteredValues).toJson());

    if (foundFilterRows.isEmpty) {
      rows = [
        ..._stateManager!.filterRows,
        FilterHelper.createFilterRow(
          columnField: 'level',
          filterType: LevelFilter(),
          filterValue: filteredLevelsJson,
        ),
      ];
    } else {
      foundFilterRows.first.cells[FilterHelper.filterFieldValue]!.value =
          filteredLevelsJson;
      rows = _stateManager!.filterRows;
    }

    _stateManager!.setFilterWithFilterRows(rows);
  }

  Widget _levelColumnWidget() {
    return MultiDropdown<Level>(
      controller: levelFilderController,
      fieldDecoration: const FieldDecoration(
        borderRadius: 0,
        border: InputBorder.none,
        padding: EdgeInsets.all(4),
        showClearIcon: false,
        hintStyle: TextStyle(
          fontSize: 14,
        ),
      ),
      chipDecoration: const ChipDecoration(
        padding: EdgeInsets.all(4),
        borderRadius: BorderRadius.all(Radius.circular(2)),
        spacing: 2,
        wrap: false,
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        deleteIcon: Icon(
          Icons.close,
          size: 6,
        ),
      ),
      items: Level.LEVELS
          .where((l) => l != Level.OFF)
          .map(
            (level) => DropdownItem(
              label: level.name.toLowerCase(),
              value: level,
            ),
          )
          .toList(),
      onSelectionChange: (values) {
        _levelFilterCheck();
      },
    );
  }

  void _toFirstSession() {}

  void _toPrevSession() {}

  void _toNextSession() {}

  void _toLastSession() {}
}

/// Level filter.
class LevelFilter extends PlutoFilterType {
  @override
  String get title => 'Level';

  @override
  PlutoCompareFunction get compare => ({
        required String? base,
        required String? search,
        required PlutoColumn column,
      }) {
        final levels = search != null
            ? LogFileRecordLevels.fromJson(
                jsonDecode(search) as Map<String, Object?>,
              )
            : const LogFileRecordLevels(levels: [Level.ALL]);

        if (levels.levels.contains(Level.ALL)) {
          return true;
        }

        final baseLevel = LevelExtensions.fromString(base ?? '');

        return levels.levels.contains(baseLevel);
      };
}

/// Logs grid controller.
class LogsGridController {
  /// Default constructor.
  LogsGridController({
    required this.onRecordSelected,
    this.toFirstSession = _emptyFunction,
    this.toPrevSession = _emptyFunction,
    this.toNextSession = _emptyFunction,
    this.toLastSession = _emptyFunction,
  });

  /// Callback when record is selected.
  final void Function(LogFileRecord record) onRecordSelected;

  /// Go to the first session.
  void Function() toFirstSession;

  /// Go to the previous session.
  void Function() toPrevSession;

  /// Go to the next session.
  void Function() toNextSession;

  /// Go to the last session.
  void Function() toLastSession;

  static void _emptyFunction() {}
}
