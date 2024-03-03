import 'package:espanso_gui/Match/Replace/simple_replace_widget.dart';
import 'package:espanso_gui/main.dart';
import 'package:flutter/material.dart';

import 'Options/options_widget.dart';
import 'Replace/replace_widget.dart';
import 'Triggers/triggers_widget.dart';
import 'match_class.dart';
/*
class MatchWidget extends StatefulWidget {
  const MatchWidget({super.key, required this.match});

  final EspansoMatch match;
  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TriggersWidget(
            trigger: widget.match.trigger ?? '',
          ),
          // SimpleReplaceWidget(text: widget.match.replace),
          TriggersWidget(trigger: widget.match.replace),
          
        ],
      ),
    );
  }
}
*/