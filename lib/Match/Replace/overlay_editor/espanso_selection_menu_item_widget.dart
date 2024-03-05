import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';

import 'espanso_selection_menu_service.dart';
import 'espanso_selection_menu_widget.dart';

class EspansoSelectionMenuItemWidget extends StatefulWidget {
  const EspansoSelectionMenuItemWidget({
    super.key,
    required this.editorState,
    required this.menuService,
    required this.item,
    required this.isSelected,
    required this.espansoSelectionMenuStyle,
    this.width = 140.0,
  });

  final EditorState editorState;
  final EspansoSelectionMenuService menuService;
  final EspansoSelectionMenuItem item;
  final double width;
  final bool isSelected;
  final EspansoSelectionMenuStyle espansoSelectionMenuStyle;

  @override
  State<EspansoSelectionMenuItemWidget> createState() =>
      _EspansoSelectionMenuItemWidgetState();
}

class _EspansoSelectionMenuItemWidgetState
    extends State<EspansoSelectionMenuItemWidget> {
  var _onHover = false;

  @override
  Widget build(BuildContext context) {
    final style = widget.espansoSelectionMenuStyle;
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
      child: SizedBox(
        width: widget.width,
        child: TextButton.icon(
          icon: widget.item.icon(
            widget.editorState,
            widget.isSelected || _onHover,
            widget.espansoSelectionMenuStyle,
          ),
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            overlayColor: MaterialStateProperty.all(
              style.espansoSelectionMenuItemSelectedColor,
            ),
            backgroundColor: widget.isSelected
                ? MaterialStateProperty.all(
                    style.espansoSelectionMenuItemSelectedColor,
                  )
                : MaterialStateProperty.all(Colors.transparent),
          ),
          label: Text(
            widget.item.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: (widget.isSelected || _onHover)
                  ? style.espansoSelectionMenuItemSelectedTextColor
                  : style.espansoSelectionMenuItemTextColor,
              fontSize: 12.0,
            ),
          ),
          onPressed: () {
            widget.item.handler(
              widget.editorState,
              widget.menuService,
              context,
            );
          },
          onHover: (value) {
            setState(() {
              _onHover = value;
            });
          },
        ),
      ),
    );
  }
}
