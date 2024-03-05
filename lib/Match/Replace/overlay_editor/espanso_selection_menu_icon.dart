import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';

import 'espanso_selection_menu_widget.dart';

class EspansoSelectionMenuIconWidget extends StatelessWidget {
  EspansoSelectionMenuIconWidget({
    super.key,
    this.name,
    this.icon,
    required this.isSelected,
    required this.style,
  }) {
    assert((name == null && icon != null) || ((name != null && icon == null)));
  }

  final String? name;
  final IconData? icon;
  final bool isSelected;
  final EspansoSelectionMenuStyle style;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return Icon(
        icon,
        size: 18.0,
        color: isSelected
            ? style.espansoSelectionMenuItemSelectedIconColor
            : style.espansoSelectionMenuItemIconColor,
      );
    } else if (name != null) {
      return EditorSvg(
        name: 'espanso_selection_menu/$name',
        width: 18.0,
        height: 18.0,
        color: isSelected
            ? style.espansoSelectionMenuItemSelectedIconColor
            : style.espansoSelectionMenuItemIconColor,
      );
    }
    throw UnimplementedError();
  }
}
