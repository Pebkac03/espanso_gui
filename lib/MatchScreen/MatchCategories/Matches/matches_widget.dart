import 'package:espanso_gui/Match/Options/options_widget.dart';
import 'package:espanso_gui/Match/Triggers/triggers_widget.dart';
import 'package:data_table_2/data_table_2.dart';

import '/Match/match_class.dart';
import 'package:flutter/material.dart';

class MatchesWidget extends StatefulWidget {
  const MatchesWidget({super.key, this.matches});
  final List<EspansoMatch>? matches;
  @override
  State<MatchesWidget> createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  static const double height = 25;
  List<DataRow>? widgets;

  @override
  Widget build(BuildContext context) {
    widgets ??= widget.matches?.map((match) {
      return DataRow2(cells: [
        DataCell(
          showEditIcon: true,
          TriggersWidget(trigger: match.trigger ?? ''),
        ),
        DataCell(
          showEditIcon: true,
          TriggersWidget(trigger: match.replace),
        ),
        DataCell(
          OptionsWidget(
            option: match.propagateCase,
          ),
        ),
        DataCell(
          OptionsWidget(
            option: match.capitaliseEachWord,
          ),
        ),
        DataCell(
          OptionsWidget(
            option: match.triggerOnWord,
          ),
        ),
      ]);
    }).toList();

    // TODO: implement build
    return DataTable2(
      horizontalMargin: 15,
      columnSpacing: 15,
      dataRowHeight: height,
      border: TableBorder.all(),
      headingTextStyle: Theme.of(context).textTheme.titleSmall,
      headingRowHeight: height,
      columns: const [
        DataColumn2(
            fixedWidth: 100,
            label: Text(
              'trigger',
              textAlign: TextAlign.center,
            )),
        DataColumn2(
            fixedWidth: 250,
            label: Text(
              'replace',
              textAlign: TextAlign.center,
            )),
        DataColumn2(
            fixedWidth: 130,
            label: Text(
              'Propagate Case',
              textAlign: TextAlign.center,
            )),
        DataColumn2(
            fixedWidth: 170,
            label: Text(
              'Capitalize Each Word',
              textAlign: TextAlign.center,
            )),
        DataColumn2(
            fixedWidth: 120,
            label: Text(
              'Trigger on word',
              textAlign: TextAlign.center,
            ))
      ],
      rows: widgets ?? [],
    );
  }
}
