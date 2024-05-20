import 'dart:io';

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'package:stacked/stacked.dart';

import 'matches_table_model.dart';

class MatchesTable extends StackedView<MatchesTableModel> {
  final File file;

  const MatchesTable({super.key, required this.file});
  static const double ROW_HEIGHT = 30;
  static const double SELECT_WIDTH = PlutoGridSettings.columnWidth * 0.5;
  static const double LABEL_WIDTH = PlutoGridSettings.columnWidth * 0.7;
  static const double TRIGGER_WIDTH = PlutoGridSettings.columnWidth * 0.7;
  static const double REPLACE_WIDTH = PlutoGridSettings.columnWidth;

  @override
  Widget builder(
    BuildContext context,
    MatchesTableModel viewModel,
    Widget? child,
  ) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    PlutoGridStateManager? stateManager;

    List<PlutoColumn> columns = [
      PlutoColumn(
          title: 'Label',
          field: 'label',
          type: PlutoColumnType.text(),
          width: LABEL_WIDTH,
          minWidth: LABEL_WIDTH,
          enableColumnDrag: false,
          enableRowDrag: false,
          enableContextMenu: false,
          enableDropToResize: false),
      PlutoColumn(
          title: 'Trigger',
          field: 'trigger',
          type: PlutoColumnType.text(),
          width: TRIGGER_WIDTH,
          minWidth: TRIGGER_WIDTH,
          enableColumnDrag: false,
          enableRowDrag: false,
          enableContextMenu: false,
          enableDropToResize: false),
      PlutoColumn(
        title: 'Replace',
        field: 'replace',
        type: PlutoColumnType.text(),
        width: REPLACE_WIDTH,
        minWidth: REPLACE_WIDTH,
        enableColumnDrag: false,
        enableRowDrag: false,
        enableContextMenu: false,
        enableDropToResize: false,
        formatter: (value) {
          if (value.contains('\n') &&
              value == stateManager?.currentCell?.value) {
            debugPrint('Formatter: value contains newline');
            stateManager?.setGridMode(PlutoGridMode.select);
          }

          return value.replaceAll('\n', ' ');
        },
      ),
      PlutoColumn(
        title: 'Title Case',
        field: 'titleCase',
        type: PlutoColumnType.select([true, false], defaultValue: false),
        readOnly: true,
        width: SELECT_WIDTH,
        minWidth: SELECT_WIDTH,
        enableColumnDrag: false,
        enableRowDrag: false,
        enableContextMenu: false,
        enableDropToResize: false,
        renderer: (rendererContext) {
          return Center(
            child: Checkbox(
              value: rendererContext.cell.value,
              onChanged: (value) {
                int index = rendererContext.rowIdx;
                viewModel.updateTitleCase(index, value!);
                debugPrint('MatchesTable: changed cell value to ${value}');
              },
            ),
          );
        },
      ),
      PlutoColumn(
        title: 'Match Case',
        field: 'propagateCase',
        type: PlutoColumnType.select([true, false], defaultValue: false),
        width: SELECT_WIDTH,
        minWidth: SELECT_WIDTH,
        enableColumnDrag: false,
        enableRowDrag: false,
        enableContextMenu: false,
        enableDropToResize: false,
        renderer: (rendererContext) => Center(
          child: Checkbox(
            value: rendererContext.cell.value,
            onChanged: (value) {
              int index = rendererContext.rowIdx;
              viewModel.updatePropagateCase(index, value!);
              debugPrint(
                  'MatchesTable: changed cell value to ${rendererContext.cell.value}');
            },
          ),
        ),
      ),
      PlutoColumn(
        title: 'Require Word',
        field: 'onlyOnWord',
        type: PlutoColumnType.select([true, false], defaultValue: false),
        width: SELECT_WIDTH,
        minWidth: SELECT_WIDTH,
        enableColumnDrag: false,
        enableRowDrag: false,
        enableContextMenu: false,
        enableDropToResize: false,
        renderer: (rendererContext) => Center(
          child: Checkbox(
            value: rendererContext.cell.value,
            onChanged: (value) {
              int index = rendererContext.rowIdx;
              viewModel.updateOnlyOnWord(index, value!);
              debugPrint(
                  'MatchesTable: changed cell value to ${rendererContext.cell.value}');
            },
          ),
        ),
      ),
    ];

    return Column(
      children: [
        Expanded(
          child: PlutoGrid(
            columns: columns,
            rows: viewModel.rows,
            mode: PlutoGridMode.select,
            configuration: PlutoGridConfiguration(
                shortcut: const PlutoGridShortcut(),
                columnSize: const PlutoGridColumnSizeConfig(
                    resizeMode: PlutoResizeMode.none,
                    autoSizeMode: PlutoAutoSizeMode.scale),
                style: PlutoGridStyleConfig(
                    gridBackgroundColor: colorScheme.surfaceContainerHighest,
                    menuBackgroundColor: colorScheme.surfaceContainerHighest,
                    gridBorderColor: colorScheme.outline,
                    rowColor: colorScheme.surfaceContainerHighest,
                    cellColorInEditState: colorScheme.surfaceContainerHighest,
                    cellColorInReadOnlyState:
                        colorScheme.surfaceContainerHighest,
                    activatedColor: colorScheme.surfaceContainerHighest,
                    borderColor: colorScheme.outline,
                    activatedBorderColor: colorScheme.primary,
                    cellTextStyle: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ))),
            onSelected: (event) {
              final dialogWidth = MediaQuery.sizeOf(context).width;
              final dialogHeight = MediaQuery.sizeOf(context).height;
              showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) => Dialog(
                      insetPadding: EdgeInsets.zero,
                      shape: const ContinuousRectangleBorder(),
                      elevation: 40,
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: Colors.white,
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.zero,
                        width: dialogWidth / 2.618,
                        height: dialogHeight,
                      )));
              if (!event.cell?.value.contains('\n')) {
                debugPrint(
                    'Matches Table - onSelected: cell does not contain newline');
                stateManager?.setCurrentCell(event.cell, event.rowIdx);
                stateManager?.setGridMode(PlutoGridMode.normal);
                stateManager?.setCurrentCell(event.cell, event.rowIdx);
                // stateManager?.setEditing(true);
                stateManager?.setEditing(true);
                // stateManager?.setEditing(true);
                return;
              }
              debugPrint(
                  'Matches Table - onSelected: cell does contain newline');
            },
            onChanged: (event) {
              if (event.value.contains('\n')) {
                debugPrint('Pluto Grid: cell is multiline');
                stateManager?.setGridMode(PlutoGridMode.select);
                return;
              }
              debugPrint('Pluto Grid: cell is NOT multiline');
              return;
            },
            onLoaded: (event) {
              stateManager = event.stateManager;
            },
          ),
        ),
        Expanded(
            child: TextButton(
                onPressed: () => viewModel.saveMatches(),
                child: const Text('Save')))
      ],
    );
  }

  @override
  MatchesTableModel viewModelBuilder(
    BuildContext context,
  ) =>
      MatchesTableModel(file);
}
