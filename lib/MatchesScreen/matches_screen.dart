import 'package:espanso_gui/MatchesScreen/matches_widget.dart';
import 'package:flutter/material.dart';

import 'Match/Replace/overlay_editor/overlay_editor_widget.dart';
import 'Match/match_class.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key, this.matches});

  final Map<String, List<EspansoMatch>>? matches;

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  OverlayEntry? currentOverlay;

  void hideOverlay() {
    currentOverlay?.remove();
    currentOverlay = null;
  }

  void showOverlay(String text) {
    if (currentOverlay != null) {
      currentOverlay?.remove();
    }
    currentOverlay = OverlayEntry(builder: (context) {
      return OverlayEditor(
        text: text,
        hideOverlay: hideOverlay,
      );
    });
    Overlay.of(context).insert(currentOverlay!);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<EspansoMatch>> matches =
        EspansoMatches.fromYaml().matches?.cast() ?? {};

    List<Widget> widgets = matches.values.map((value) {
      return MatchesWidget(
        matches: value,
        hideOverlay: hideOverlay,
        showOverlay: showOverlay,
      );
    }).toList();

    List<Widget> titles = matches.keys.map((key) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Tab(
          text: key,
        ),
      );
    }).toList();

    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 30),
      child: DefaultTabController(
          length: widgets.length,
          child: SizedBox(
            width: 830,
            child: Column(
              children: [
                Container(
                    height: 55,
                    width: 800,
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TabBar(
                      onTap: (e) => hideOverlay(),
                      tabs: titles,
                    )),
                Expanded(child: TabBarView(children: widgets)),
              ],
            ),
          )),
    );
  }
}
