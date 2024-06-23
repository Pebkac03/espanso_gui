import 'dart:io';

import 'package:espanso_gui_v2/ui/widgets/matches_table2/menu_row/matches_table2_menu_row.dart';
import 'package:espanso_gui_v2/ui/widgets/matches_table2/row/row.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'matches_table2_model.dart';

class MatchesTable2 extends StackedView<MatchesTable2Model> {
  static const double onWidth = 1;
  static const double offWidth = 2;
  static const double rowHeight = 35;
  static const double cellPadding = 8;
  static const double borderWidth = 1;

  final File file;
  const MatchesTable2({super.key, required this.file});

  @override
  Widget builder(
    BuildContext context,
    MatchesTable2Model viewModel,
    Widget? child,
  ) {
    final Color onColor = Theme.of(context).colorScheme.primary;
    final Color offColor = Theme.of(context).colorScheme.outline;
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium;

    List<MatchesTable2Row> rows() {
      return viewModel.matches.map((e) {
        return MatchesTable2Row(
          match: e,
          offWidth: borderWidth,
          rowHeight: rowHeight,
          onColor: onColor,
          offColor: offColor,
          textStyle: textStyle,
        );
      }).toList();
    }

    return ListView(
      children: [
        MatchesTable2MenuRow(
            rowHeight: rowHeight * 1.5,
            cellPadding: cellPadding,
            borderColor: offColor,
            borderWidth: borderWidth,
            textStyle: textStyle?.copyWith(fontWeight: FontWeight.bold)),
        ...rows(),
        TextButton(
          child: Text(
            'Save',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onPressed: () {
            viewModel.save();
            debugPrint(
                'label: ${viewModel.matches[0].label} trigger: ${viewModel.matches[0].trigger.trigger} replace: ${viewModel.matches[0].replace.text} onlyOnWord: ${viewModel.matches[0].onlyOnWord}');
          },
        )
      ],
    );
  }

  @override
  MatchesTable2Model viewModelBuilder(
    BuildContext context,
  ) =>
      MatchesTable2Model(file: file);
}
