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

    List<Widget> titles = matches.keys.map((key) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Tab(
          text: key,
        ),
      );
    }).toList();

    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: 100, left: 40),
        child: DefaultTabController(
            length: widgets.length,
            child: SizedBox(
              width: 830,
              child: Column(
                children: [
                  SizedBox(height: 40, width: 800, child: TabBar(tabs: titles)),
                  Expanded(child: TabBarView(children: widgets)),
                ],
              ),
            )),
      ),
    );
  }
}
