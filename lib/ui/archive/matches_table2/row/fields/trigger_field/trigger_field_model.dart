import 'package:espanso_gui_v2/models/espanso_trigger_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TriggerFieldModel extends BaseViewModel {
  final TextEditingController textController;
  final int overlayLengthThreshold;
  final void Function(EspansoTriggerField text) onSubmitted;
  TriggerFieldModel({
    required this.textController,
    required this.overlayLengthThreshold,
    required this.onSubmitted,
  });
  int stackIndex = 0;

  bool _showFocus = false;
  bool get showFocus => _showFocus;
  set showFocus(bool e) {
    _showFocus = e;
    !e ? stackIndex = 0 : {};
    !e ? debugPrint('EspansoLabelField: text submitted') : {};
    !e ? onSubmitted(EspansoTriggerField(trigger: textController.text)) : {};
    rebuildUi();
  }

  OverlayPortalController? _overlayController;
  OverlayPortalController get overlayController =>
      _overlayController ??= OverlayPortalController();

  final textFocus = FocusNode();

  void showOverlay() => overlayController.show();
  void hideOverlay() {
    debugPrint('Field View Model: hideOverlay() hiding field');
    overlayController.hide();
    rebuildUi();
  }

  void startEditing() {
    stackIndex = 1;
    textFocus.requestFocus();
    textController.selection =
        TextSelection.collapsed(offset: textController.selection.end);
    rebuildUi();
  }

  void stopEditing() {
    debugPrint('EspansoLabelField: text submitted');
    onSubmitted(EspansoTriggerField(trigger: textController.text));
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
