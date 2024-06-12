import 'package:espanso_gui_v2/models/espanso_match_model.dart';
import 'package:espanso_gui_v2/models/espanso_replace_field.dart';
import 'package:espanso_gui_v2/ui/widgets/matches_table2/row/fields/checkbox_field/checkbox_field/checkbox_field.dart';
import 'package:espanso_gui_v2/ui/widgets/matches_table2/row/fields/label_field/label_field/label_field.dart';
import 'package:espanso_gui_v2/ui/widgets/matches_table2/row/fields/replace_field/replace_field.dart';
import 'package:espanso_gui_v2/ui/widgets/matches_table2/row/fields/trigger_field/trigger_field.dart';
import 'package:espanso_gui_v2/ui/widgets/matches_table2/row/overlays/replace_field_overlay.dart';
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

    return Row(
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
      ],
    );
  }

  @override
  MatchesTable2RowModel viewModelBuilder(
    BuildContext context,
  ) =>
      MatchesTable2RowModel(match: match);
}
