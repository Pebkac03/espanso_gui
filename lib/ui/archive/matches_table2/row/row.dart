import 'package:espanso_gui_v2/models/espanso_match_model.dart';
import 'package:espanso_gui_v2/models/espanso_replace_field.dart';
import 'package:espanso_gui_v2/ui/archive/matches_table2/row/fields/advanced_field/advanced_field.dart';
import 'package:espanso_gui_v2/ui/archive/matches_table2/row/fields/checkbox_field/checkbox_field/checkbox_field.dart';
import 'package:espanso_gui_v2/ui/archive/matches_table2/row/fields/label_field/label_field/label_field.dart';
import 'package:espanso_gui_v2/ui/archive/matches_table2/row/fields/replace_field/replace_field.dart';
import 'package:espanso_gui_v2/ui/archive/matches_table2/row/fields/trigger_field/trigger_field.dart';
import 'package:espanso_gui_v2/ui/archive/matches_table2/row/overlays/replace_field_overlay.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'row_model.dart';

class MatchesTable2Row extends StackedView<MatchesTable2RowModel> {
  final EspansoMatch match;
  final double? onWidth;
  final double offWidth;
  final double rowHeight;
  final double cellPadding;
  final Color onColor;
  final Color offColor;
  final TextStyle? textStyle;

  static const List<TableRow> variablesTestData = [
    TableRow(
      children: [
        Text('test 1'),
        Text('test 2'),
        Text('test 3'),
      ],
    ),
    TableRow(
      children: [
        Text('test 1'),
        Text('test 2'),
        Text('test 3'),
      ],
    ),
    TableRow(
      children: [
        Text('test 1'),
        Text('test 2'),
        Text('test 3'),
      ],
    ),
  ];

  const MatchesTable2Row(
      {super.key,
      required this.match,
      this.onWidth,
      required this.offWidth,
      required this.rowHeight,
      this.cellPadding = 8,
      required this.onColor,
      required this.offColor,
      this.textStyle});

  @override
  Widget builder(
    BuildContext context,
    MatchesTable2RowModel viewModel,
    Widget? child,
  ) {
    debugPrint('ui rebuilt');
    final BorderSide borderSide =
        BorderSide(color: Theme.of(context).colorScheme.outline);

    return Column(
      children: [
        Row(
          children: [
            LabelField(
              entry: match.label,
              offWidth: offWidth,
              focusWidthFactor: 2,
              offColor: offColor,
              onColor: onColor,
              rowHeight: rowHeight,
              cellPadding: cellPadding,
              textStyle: textStyle,
              onSubmitted: (text) => match.label = text,
            ),
            TriggerField(
              entry: match.trigger,
              offWidth: offWidth,
              onWidth: onWidth,
              offColor: offColor,
              onColor: onColor,
              rowHeight: rowHeight,
              cellPadding: cellPadding,
              textStyle: textStyle,
              onSubmitted: (entry) => match.trigger = entry,
              overlay: (controller) => null,
            ),
            ReplaceField(
              value: match.replace,
              offWidth: offWidth,
              focusWidthFactor: 1,
              offColor: offColor,
              onColor: onColor,
              rowHeight: rowHeight,
              cellPadding: cellPadding,
              textStyle: textStyle,
              onSubmitted: (EspansoReplaceField entry) => match.replace = entry,
              overlay: (controller) => ReplaceFieldOverlay(
                controller: controller,
              ),
            ),
            CheckboxField(
                entry: match.onlyOnWord,
                rowHeight: rowHeight,
                cellPadding: cellPadding,
                offWidth: offWidth,
                offColor: offColor,
                onColor: onColor,
                onSubmitted: (e) => match.onlyOnWord = e),
            CheckboxField(
                entry: match.onlyOnWord,
                rowHeight: rowHeight,
                cellPadding: cellPadding,
                offWidth: offWidth,
                offColor: offColor,
                onColor: onColor,
                onSubmitted: (e) => match.propagateCase = e),
            CheckboxField(
                entry: match.onlyOnWord,
                rowHeight: rowHeight,
                cellPadding: cellPadding,
                offWidth: offWidth,
                offColor: offColor,
                onColor: onColor,
                onSubmitted: (e) => match.titleCase = e),
            AdvancedField(
              entry: viewModel.advancedMode,
              rowHeight: rowHeight,
              cellPadding: cellPadding,
              offWidth: offWidth,
              offColor: offColor,
              onColor: onColor,
              onSubmitted: (e) => viewModel.advancedMode = e,
              onDropdown: (e) {
                viewModel.visibility = e;
              },
            ),
          ],
        ),
        Visibility(
          visible: viewModel.visibility,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              border: Border.symmetric(
                vertical: borderSide,
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    children: [
                      Text('Triggers'),
                    ],
                  ),
                ),
                VerticalDivider(color: Theme.of(context).colorScheme.outline),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Variables'),
                      Table(
                          border: TableBorder(
                              verticalInside: borderSide,
                              horizontalInside: borderSide),
                          children: variablesTestData)
                    ],
                  ),
                ),
                VerticalDivider(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 1,
                ),
                const Expanded(
                  child: Column(
                    children: [Text('Forms')],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  MatchesTable2RowModel viewModelBuilder(
    BuildContext context,
  ) =>
      MatchesTable2RowModel(match: match);
}
