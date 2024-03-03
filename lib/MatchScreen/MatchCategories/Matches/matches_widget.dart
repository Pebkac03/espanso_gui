import 'package:espanso_gui/Match/match_widget.dart';

import '/Match/match_class.dart';
import 'package:flutter/material.dart';

class MatchesWidget extends StatefulWidget {
  MatchesWidget({this.matches});
  final List<EspansoMatch>? matches;
  @override
  State<MatchesWidget> createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  List<Widget>? widgets;

  @override
  Widget build(BuildContext context) {
    widgets ??= widget.matches?.map((match) {
      return MatchWidget(match: match);
    }).toList();

    // TODO: implement build
    return ListView(
      children: widgets ?? [],
    );
  }
}
