import 'package:espanso_gui/Match/match_widget.dart';
import 'package:espanso_gui/MatchScreen/MatchCategories/Matches/matches_widget.dart';
import 'package:flutter/material.dart';

import '../../Match/match_class.dart';

class MatchCategoriesWidget extends StatefulWidget {
  const MatchCategoriesWidget({super.key, this.matches});

  final Map<String, List<EspansoMatch>>? matches;

  @override
  State<MatchCategoriesWidget> createState() => _MatchCategoriesWidgetState();
}

class _MatchCategoriesWidgetState extends State<MatchCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    final Map<String, List<EspansoMatch>> matches =
        EspansoMatches.fromYaml().matches?.cast() ?? {};

    List<Widget> widgets = matches.values.map((value) {
      return MatchesWidget(matches: value);
    }).toList();

    List<Tab> titles = matches.keys.map((key) {
      return Tab(
        text: key,
      );
    }).toList();

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: DefaultTabController(
            length: widgets.length,
            child: Column(
              children: [
                SizedBox(height: 40, child: TabBar(tabs: titles)),
                Expanded(
                  child: SizedBox(child: TabBarView(children: widgets)),
                ),
              ],
            )),
      ),
    );
  }
}
