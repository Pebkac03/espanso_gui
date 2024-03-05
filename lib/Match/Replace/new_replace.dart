import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:espanso_gui/Match/Replace/overlay_editor/overlay_editor_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewReplaceWidget extends StatefulWidget {
  String trigger;

  NewReplaceWidget({super.key, required this.trigger});

  @override
  State<NewReplaceWidget> createState() => _NewReplaceWidgetState();
}

class _NewReplaceWidgetState extends State<NewReplaceWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  final OverlayPortalController _overlayController = OverlayPortalController();

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
              _controller.text.replaceAll('\n', ' '),
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

    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: (context) {
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: EdgeInsets.only(left: constraints.maxWidth * 0.5),
            child: const OverlayEditor(),
          );
        });
      },
      child: Row(
        children: [
          Expanded(
            child: AutoSizeTextField(
              onChanged: (value) => widget.trigger = value,
              autofocus: true,
              focusNode: _focusNode,
              overflowReplacement: _overflowReplacement,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 4),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none, gapPadding: 0),
                filled: false,
                focusColor: null,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, gapPadding: 0),
              ),
              maxFontSize: theme.textTheme.bodyMedium?.fontSize ?? 0,
              minFontSize: theme.textTheme.bodyMedium?.fontSize ?? 0,
              textAlignVertical: TextAlignVertical.center,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium,
              controller: _controller,
            ),
          ),
          IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              onPressed: () {
                _overlayController.show();
              },
              icon: const Icon(Icons.edit, size: 20))
        ],
      ),
    );
  }
}
