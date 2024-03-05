import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';

class OverlayEditor extends StatefulWidget {
  const OverlayEditor({super.key});

  @override
  State<OverlayEditor> createState() => _OverlayEditorState();
}

class _OverlayEditorState extends State<OverlayEditor> {
  final EditorState _controller =
      EditorState(document: Document.blank(withInitialText: true));
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).canvasColor,
      child: AppFlowyEditor(
        autoFocus: true,
        editorState: _controller,
        editorStyle: const EditorStyle.desktop(),
      ),
    );
  }
}
