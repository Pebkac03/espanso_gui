import 'package:espanso_gui/Match/match_class.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatefulWidget {
  bool form;
  bool propagateCase;
  bool capitalizeEachWord;
  bool triggerOnWord;

  OptionsWidget({
    super.key,
    required this.form,
    required this.propagateCase,
    required this.capitalizeEachWord,
    required this.triggerOnWord,
  });

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
                value: widget.form,
                onChanged: (bool? e) {
                  setState(() {
                    // print(widget.form);
                    widget.form = e ?? false;
                  });
                }),
            const Text('Form'),
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: widget.propagateCase,
                onChanged: (bool? e) {
                  setState(() {
                    widget.propagateCase = e ?? false;
                  });
                }),
            const Text('Propagate case'),
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: widget.capitalizeEachWord,
                onChanged: (bool? e) {
                  setState(() {
                    widget.capitalizeEachWord = e ?? false;
                  });
                }),
            const Text('Capitalise each word'),
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: widget.triggerOnWord,
                onChanged: (bool? e) {
                  setState(() {
                    widget.triggerOnWord = e ?? false;
                  });
                }),
            const Text('Require word to trigger'),
          ],
        ),
      ],
    );
  }
}
