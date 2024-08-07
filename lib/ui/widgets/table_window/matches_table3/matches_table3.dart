import 'dart:io';

import 'package:espanso_gui_v2/models/espanso_match_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'matches_table3_model.dart';

class MatchesTable3 extends StackedView<MatchesTable3Model> {
  static const double _triggerMaxWidth = 50;
  static const double _replaceMaxWidth = 100;
  Function(EspansoMatch e) onChanged;

  final File file;
  MatchesTable3({super.key, required this.file, required this.onChanged});

  @override
  Widget builder(
    BuildContext context,
    MatchesTable3Model viewModel,
    Widget? child,
  ) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodyMedium ??
        const TextStyle(fontSize: 14, color: Colors.black);

    Widget textCell(
        {required text,
        required Function(String value) onChanged,
        double maxWidth = double.infinity}) {
      final TextEditingController controller =
          TextEditingController(text: text);
      return TextField(
        controller: controller,
        onSubmitted: (value) {
          text = value;
          onChanged(value);
        },
        style: textStyle,
        decoration: InputDecoration(
            border: InputBorder.none,
            constraints: BoxConstraints(maxWidth: maxWidth)),
      );
    }

    Widget checkboxCell(
        {required bool value, required Function(bool value) onChanged}) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Center(
            child: Checkbox(
              value: value,
              onChanged: (f) {
                setState(() => f != null ? value = f : {});
                onChanged(f ?? false);
              },
            ),
          );
        },
      );
    }

    final List<DataRow> rows = viewModel.matches.map(
      (e) {
        return DataRow(
          cells: [
            DataCell(textCell(
                onChanged: (value) =>
                    e.trigger = e.trigger.copyWith(trigger: value),
                text: e.trigger.trigger)),
            DataCell(textCell(
              text: e.replace.text,
              onChanged: (value) => e.replace = e.replace.copyWith(text: value),
            )),
            DataCell(checkboxCell(
                value: e.onlyOnWord,
                onChanged: (value) => e.onlyOnWord = value)),
            DataCell(checkboxCell(
              value: e.propagateCase,
              onChanged: (value) => e.propagateCase = value,
            )),
            DataCell(checkboxCell(
              value: e.titleCase,
              onChanged: (value) => e.titleCase = value,
            )),
          ],
        );
      },
    ).toList();

    const List<DataColumn> columns = [
      DataColumn(label: Text('trigger')),
      DataColumn(label: Text('replace')),
      DataColumn(
          label: Text('require word'),
          headingRowAlignment: MainAxisAlignment.center),
      DataColumn(
          label: Text('match case'),
          headingRowAlignment: MainAxisAlignment.center),
      DataColumn(
          label: Text('title case'),
          headingRowAlignment: MainAxisAlignment.center),
    ];
    return DataTable(
      columns: columns,
      rows: rows,
      columnSpacing: 24,
    );
  }

  @override
  MatchesTable3Model viewModelBuilder(
    BuildContext context,
  ) =>
      MatchesTable3Model(file: file);
}
