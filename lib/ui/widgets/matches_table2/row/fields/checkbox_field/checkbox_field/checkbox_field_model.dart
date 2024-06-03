import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CheckboxFieldModel extends BaseViewModel {
  final bool initialValue;
  final void Function(bool value) onSubmitted;
  bool? _checked;

  CheckboxFieldModel({required this.initialValue, required this.onSubmitted});

  bool _showFocus = false;
  bool get showFocus => _showFocus;

  get checked => _checked ??= initialValue;
  void setCheckbox(e) {
    _checked = e;
    onSubmitted(e);
    rebuildUi();
  }

  void toggleCheckbox() {
    _checked = !checked;
    onSubmitted(checked);
    rebuildUi();
  }

  set showFocus(bool e) {
    _showFocus = e;
    !e ? debugPrint('EspansoLabelField: text submitted') : {};
    rebuildUi();
  }
}
