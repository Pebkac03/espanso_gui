import 'package:espanso_gui_v2/models/espanso_match_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MatchesTable2RowModel extends BaseViewModel {
  final EspansoMatch match;
  MatchesTable2RowModel({required this.match});

  bool get labelFocused => labelFocusNode.hasFocus;
  bool get triggerFocused => triggerFocusNode.hasFocus;
  bool get replaceFocused => replaceFocusNode.hasFocus;
  bool get onlyOnWordFocused => onlyOnWordFocusNode.hasFocus;
  bool get propagateCaseFocused => propagateCaseFocusNode.hasFocus;
  bool get titleCaseFocused => titleCaseFocusNode.hasFocus;

  FocusNode labelFocusNode = FocusNode();
  FocusNode triggerFocusNode = FocusNode();
  FocusNode replaceFocusNode = FocusNode();
  FocusNode propagateCaseFocusNode = FocusNode();
  FocusNode titleCaseFocusNode = FocusNode();
  FocusNode onlyOnWordFocusNode = FocusNode();

  bool _showLabelFocus = false;
  bool _showTriggerFocus = false;
  bool _showReplaceFocus = false;
  bool _showPropagateCaseFocus = false;
  bool _showTitleCaseFocus = false;
  bool _showOnlyOnWordFocus = false;

  bool get showLabelFocus => _showLabelFocus;
  bool get showTriggerFocus => _showTriggerFocus;
  bool get showReplaceFocus => _showReplaceFocus;
  bool get showPropagateCaseFocus => _showPropagateCaseFocus;
  bool get showTitleCaseFocus => _showTitleCaseFocus;
  bool get showOnlyOnWordFocus => _showOnlyOnWordFocus;

  void unfocusAll() {
    _showLabelFocus = false;
    _showTriggerFocus = false;
    _showReplaceFocus = false;
    _showPropagateCaseFocus = false;
    _showTitleCaseFocus = false;
    _showOnlyOnWordFocus = false;
  }

  set showLabelFocus(bool e) {
    unfocusAll();
    _showLabelFocus = e;
    rebuildUi();
  }

  set showTriggerFocus(bool e) {
    unfocusAll();
    _showTriggerFocus = e;
    rebuildUi();
  }

  set showReplaceFocus(bool e) {
    unfocusAll();
    _showReplaceFocus = e;
    rebuildUi();
  }

  set showPropagateCaseFocus(bool e) {
    unfocusAll();
    _showPropagateCaseFocus = e;
    rebuildUi();
  }

  set showTitleCaseFocus(bool e) {
    unfocusAll();
    _showTitleCaseFocus = e;
    rebuildUi();
  }

  set showOnlyOnWordFocus(e) {
    unfocusAll();
    _showOnlyOnWordFocus = e;
    rebuildUi();
  }

  set labelFocused(e) {
    debugPrint('labelFocused: setter was called');
    if (e) {
      labelFocusNode.requestFocus();
      // rebuildUi();
    } else {
      labelFocusNode.unfocus();
      // rebuildUi();
    }
  }

  set triggerFocused(e) {
    e ? triggerFocusNode.requestFocus() : triggerFocusNode.unfocus();
  }

  set replaceFocused(e) {
    e ? triggerFocusNode.requestFocus() : triggerFocusNode.unfocus();
  }

  set propagateCaseFocused(e) {
    e ? triggerFocusNode.requestFocus() : triggerFocusNode.unfocus();
  }

  set titleCaseFocused(e) {
    e ? triggerFocusNode.requestFocus() : triggerFocusNode.unfocus();
  }

  set onlyOnWordFocused(e) {
    e ? triggerFocusNode.requestFocus() : triggerFocusNode.unfocus();
  }
}
