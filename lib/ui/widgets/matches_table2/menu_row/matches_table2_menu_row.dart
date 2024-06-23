import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'matches_table2_menu_row_model.dart';

class MatchesTable2MenuRow extends StackedView<MatchesTable2MenuRowModel> {
  final double rowHeight;
  final double cellPadding;
  final Color borderColor;
  final double borderWidth;
  final TextStyle? textStyle;

  const MatchesTable2MenuRow({
    super.key,
    required this.rowHeight,
    required this.cellPadding,
    required this.borderColor,
    required this.borderWidth,
    required this.textStyle,
  });

  @override
  Widget builder(
    BuildContext context,
    MatchesTable2MenuRowModel viewModel,
    Widget? child,
  ) {
    titleCell(String text) {
      return Expanded(
          child: Container(
        alignment: Alignment.centerLeft,
        height: rowHeight,
        padding: EdgeInsets.symmetric(horizontal: cellPadding, vertical: 0),
        decoration: BoxDecoration(
            border: Border.all(width: borderWidth, color: borderColor)),
        child: Text(
          text,
          style: textStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }

    return Row(
      children: [
        titleCell('Label'),
        titleCell('Trigger'),
        titleCell('Replace'),
        titleCell('Require Word'),
        titleCell('Match trigger capitalization'),
        titleCell('Capitalize each word'),
      ],
    );
  }

  @override
  MatchesTable2MenuRowModel viewModelBuilder(
    BuildContext context,
  ) =>
      MatchesTable2MenuRowModel();
}
