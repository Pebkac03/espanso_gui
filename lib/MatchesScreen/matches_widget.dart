import 'package:espanso_gui/MatchesScreen/Match/Options/options_widget.dart';
import 'package:espanso_gui/MatchesScreen/Match/Replace/replace_widget.dart';
import 'package:espanso_gui/MatchesScreen/Match/Replace/overlay_editor/overlay_editor_widget.dart';
import 'package:espanso_gui/MatchesScreen/Match/Triggers/triggers_widget.dart';
import 'package:data_table_2/data_table_2.dart';

import 'Match/Variables/variables_widget.dart';
import 'Match/match_class.dart';
import 'package:flutter/material.dart';

class MatchesWidget extends StatefulWidget {
  const MatchesWidget(
      {super.key,
      this.matches,
      required this.hideOverlay,
      required this.showOverlay});
  final List<EspansoMatch>? matches;
  final Function hideOverlay;
  final Function showOverlay;

  @override
  State<MatchesWidget> createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  static const double height = 25;
  List<DataRow>? widgets;
  OverlayEntry? currentOverlay;

  @override
  Widget build(BuildContext context) {
    widgets ??= widget.matches?.map((match) {
      return DataRow2(cells: [
        DataCell(
          showEditIcon: true,
          TriggersWidget(trigger: match.trigger ?? ''),
        ),
        DataCell(
          NewReplaceWidget(
            replace: match.replace,
            hideOverlay: widget.hideOverlay,
            showOverlay: widget.showOverlay,
          ),
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
        DataCell(VariablesWidget())
      ]);
    }).toList();

    // TODO: implement build
    return Material(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.black,
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: DataTable2(
          dataRowColor: MaterialStateColor.resolveWith(
              (states) => Theme.of(context).colorScheme.surface),
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
                )),
            DataColumn2(
                fixedWidth: 80,
                label: Text(
                  'Variables',
                  textAlign: TextAlign.center,
                ))
          ],
          rows: widgets ?? [],
        ),
      ),
    );
  }
}
