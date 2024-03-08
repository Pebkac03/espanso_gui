import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

class NewReplaceWidget extends StatefulWidget {
  final Function hideOverlay;
  final Function showOverlay;
  String replace;

  NewReplaceWidget(
      {super.key,
      required this.replace,
      required this.hideOverlay,
      required this.showOverlay});

  @override
  State<NewReplaceWidget> createState() => _NewReplaceWidgetState();
}

class _NewReplaceWidgetState extends State<NewReplaceWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  Widget? _overflowReplacement;

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.replace;
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

    return Row(
      children: [
        Expanded(
          child: AutoSizeTextField(
            onTap: () => widget.hideOverlay(),
            onChanged: (value) => widget.replace = value,
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
              widget.showOverlay(_controller.text);
            },
            icon: const Icon(Icons.edit, size: 20))
      ],
    );
  }
}
