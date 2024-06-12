import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LabelFieldModel extends BaseViewModel {
  final TextEditingController textController;
  final void Function(String text) onSubmitted;
  final double focusWidthFactor;
  final double offWidth;
  LabelFieldModel({
    required this.textController,
    required this.onSubmitted,
    required this.offWidth,
    required this.focusWidthFactor,
  });
  int stackIndex = 0;

  double? _onWidth;
  double get onWidth => _onWidth ??= offWidth * focusWidthFactor;

  bool? _showFocus;
  bool get showFocus => _showFocus ?? false;
  set showFocus(bool e) {
    _showFocus = e;
    !e ? stackIndex = 0 : {};
    !e ? debugPrint('EspansoLabelField: text submitted') : {};
    !e ? onSubmitted(textController.text) : {};
    rebuildUi();
  }

  final textFocus = FocusNode();

  void startEditing() {
    stackIndex = 1;
    textFocus.requestFocus();
    textController.selection =
        TextSelection.collapsed(offset: textController.selection.end);
    rebuildUi();
  }

  void stopEditing() {
    debugPrint('EspansoLabelField: text submitted');
    onSubmitted(textController.text);
    textFocus.unfocus();
    stackIndex = 0;
    rebuildUi();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
