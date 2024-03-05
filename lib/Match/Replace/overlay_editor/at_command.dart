import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'espanso_selection_menu_service.dart';
import 'espanso_selection_menu_widget.dart';

/// Show the slash menu
///
/// - support
///   - desktop
///   - web
///
final CharacterShortcutEvent atCommand = CharacterShortcutEvent(
  key: 'show the at menu',
  character: '@',
  handler: (editorState) async => await _showAtMenu(
    editorState,
    standardEspansoSelectionMenuItems,
  ),
);

CharacterShortcutEvent customAtCommand(
  List<EspansoSelectionMenuItem> items, {
  bool shouldInsertAt = true,
  EspansoSelectionMenuStyle style = EspansoSelectionMenuStyle.light,
}) {
  return CharacterShortcutEvent(
    key: 'show the at menu',
    character: '@',
    handler: (editorState) => _showAtMenu(
      editorState,
      items,
      shouldInsertAt: shouldInsertAt,
      style: style,
    ),
  );
}

final Set<String> supportAtMenuNodeWhiteList = {
  ParagraphBlockKeys.type,
  HeadingBlockKeys.type,
  TodoListBlockKeys.type,
  BulletedListBlockKeys.type,
  NumberedListBlockKeys.type,
  QuoteBlockKeys.type,
};

EspansoSelectionMenuService? _espansoSelectionMenuService;
Future<bool> _showAtMenu(
  EditorState editorState,
  List<EspansoSelectionMenuItem> items, {
  bool shouldInsertAt = true,
  EspansoSelectionMenuStyle style = EspansoSelectionMenuStyle.light,
}) async {
  if (PlatformExtension.isMobile) {
    return false;
  }

  final selection = editorState.selection;
  if (selection == null) {
    return false;
  }

  // delete the selection
  if (!selection.isCollapsed) {
    await editorState.deleteSelection(selection);
  }

  final afterSelection = editorState.selection;
  if (afterSelection == null || !afterSelection.isCollapsed) {
    assert(false, 'the selection should be collapsed');
    return true;
  }

  final node = editorState.getNodeAtPath(selection.start.path);

  // only enable in white-list nodes
  if (node == null || !_isSupportAtMenuNode(node)) {
    return false;
  }

  // insert the slash character
  if (shouldInsertAt) {
    if (kIsWeb) {
      // Have no idea why the focus will lose after inserting on web.
      keepEditorFocusNotifier.increase();
      await editorState.insertTextAtPosition('@', position: selection.start);
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => keepEditorFocusNotifier.decrease(),
      );
    } else {
      await editorState.insertTextAtPosition('@', position: selection.start);
    }
  }

  // show the slash menu
  () {
    // this code is copied from the the old editor.
    final context = editorState.getNodeAtPath(selection.start.path)?.context;
    if (context != null) {
      _espansoSelectionMenuService = EspansoSelectionMenu(
        context: context,
        editorState: editorState,
        espansoSelectionMenuItems: items,
        deleteAtByDefault: shouldInsertAt,
        style: style,
      );
      _espansoSelectionMenuService?.show();
    }
  }();

  return true;
}

bool _isSupportAtMenuNode(Node node) {
  var result = supportSlashMenuNodeWhiteList.contains(node.type);
  if (node.level > 1 && node.parent != null) {
    return result && _isSupportAtMenuNode(node.parent!);
  }
  return result;
}
