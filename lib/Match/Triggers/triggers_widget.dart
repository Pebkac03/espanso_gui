import 'package:auto_size_text_field/auto_size_text_field.dart';

import '/main.dart';
import 'package:flutter/material.dart';
import 'package:quiver/collection.dart';

class TriggersWidget extends StatefulWidget {
  String trigger;

  TriggersWidget({super.key, required this.trigger});

  @override
  State<TriggersWidget> createState() => _TriggersWidgetState();
}

class _TriggersWidgetState extends State<TriggersWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  Widget? _overflowReplacement;

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.trigger;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _overflowReplacement = null;
        });
      } else {
        setState(() {
          _overflowReplacement = TapRegion(
            onTapInside: (event) {
              setState(() {
                _overflowReplacement = null;
              });
            },
            child: Text(
              _controller.text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(overflow: TextOverflow.ellipsis),
            ),
          );
        });
      }
    });

    final theme = Theme.of(context);

    return AutoSizeTextField(
      onChanged: (value) => widget.trigger = value,
      autofocus: true,
      focusNode: _focusNode,
      overflowReplacement: _overflowReplacement,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 4),
        border: OutlineInputBorder(borderSide: BorderSide.none, gapPadding: 0),
        filled: false,
        focusColor: null,
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide.none, gapPadding: 0),
      ),
      maxFontSize: theme.textTheme.bodyMedium?.fontSize ?? 0,
      minFontSize: theme.textTheme.bodyMedium?.fontSize ?? 0,
      textAlignVertical: TextAlignVertical.center,
      maxLines: 1,
      style: Theme.of(context).textTheme.bodyMedium,
      controller: _controller,
    );
  }
}
