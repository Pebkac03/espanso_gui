import 'package:flutter/services.dart';
import 'package:rich_text_controller/rich_text_controller.dart';
import 'package:flutter/material.dart';

class OverlayEditor extends StatefulWidget {
  final Function hideOverlay;
  final String text;
  const OverlayEditor(
      {super.key, required this.text, required this.hideOverlay});

  @override
  State<OverlayEditor> createState() => _OverlayEditorState();
}

class _OverlayEditorState extends State<OverlayEditor> {
  final RichTextController _controller =
      RichTextController(onMatch: (e) {}, patternMatchMap: {
    RegExp(r'{{\w*}}'): const TextStyle(color: Colors.blue),
    RegExp(r'\[\[\w*\]\]'): const TextStyle(color: Colors.green)
  });
  @override
  Widget build(BuildContext context) {
    _controller.text = widget.text;
    void insertBrackets(String opening, String closing) {
      String before = _controller.selection.textBefore(_controller.text);
      String after = _controller.selection.textAfter(_controller.text);
      String inside = _controller.selection.textInside(_controller.text);
      bool collapsed = _controller.selection.isCollapsed;

      _controller.text = '$before$opening$inside$closing$after';

      if (collapsed) {
        _controller.selection = TextSelection.collapsed(
            offset: _controller.selection.baseOffset - closing.length);
      }
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.only(left: constraints.maxWidth * 0.55),
        child: GestureDetector(
          child: Material(
              elevation: 10,
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        widget.hideOverlay();
                      },
                      child: const Text('close')),
                  Expanded(
                    child: CallbackShortcuts(
                      bindings: {
                        const CharacterActivator('{', control: true, alt: true):
                            () => insertBrackets('{{', '}}'),
                        const CharacterActivator('{',
                            control: false,
                            alt: false): () => insertBrackets('{{', '}}'),
                        const CharacterActivator('{',
                            control: true,
                            alt: false): () => insertBrackets('{{', '}}'),
                        const CharacterActivator('{',
                            control: false,
                            alt: true): () => insertBrackets('{{', '}}'),
                        const CharacterActivator('[', control: true, alt: true):
                            () => insertBrackets('[[', ']]'),
                        const CharacterActivator('[',
                            control: false,
                            alt: false): () => insertBrackets('[[', ']]'),
                        const CharacterActivator('[',
                            control: true,
                            alt: false): () => insertBrackets('[[', ']]'),
                        const CharacterActivator('[',
                            control: false,
                            alt: true): () => insertBrackets('[[', ']]'),
                      },
                      child: TextField(
                        expands: true,
                        controller: _controller,
                        maxLines: null,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp(r'{{}\s'),
                              allow: false, replacementString: '{ '),
                          FilteringTextInputFormatter(RegExp(r'\s{}}'),
                              allow: false, replacementString: ' {'),
                          FilteringTextInputFormatter(RegExp(r'{{}$'),
                              allow: false, replacementString: '{'),
                          FilteringTextInputFormatter(RegExp(r'^{}}'),
                              allow: false, replacementString: '{'),
                          FilteringTextInputFormatter(RegExp(r'\[\[\]\s'),
                              allow: false, replacementString: '[ '),
                          FilteringTextInputFormatter(RegExp(r'\s\[\]\]'),
                              allow: false, replacementString: ' ['),
                          FilteringTextInputFormatter(RegExp(r'\[\[\]$'),
                              allow: false, replacementString: '['),
                          FilteringTextInputFormatter(RegExp(r'^\[\]\]'),
                              allow: false, replacementString: '['),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }
}
