import 'package:espanso_gui/Match/match_class.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatefulWidget {
  bool option;

  OptionsWidget({super.key, required this.option});

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Checkbox(
          value: widget.option,
          onChanged: (e) {
            setState(() {
              widget.option = e ?? false;
            });
          }),
    );
  }
}
