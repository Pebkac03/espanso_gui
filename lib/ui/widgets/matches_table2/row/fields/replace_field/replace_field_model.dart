import 'package:espanso_gui_v2/models/espanso_replace_field.dart';
import 'package:espanso_gui_v2/models/espanso_replace_type.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ReplaceFieldModel extends BaseViewModel {
  final TextEditingController textController;
  final int overlayLengthThreshold;
  EspansoReplaceType type;
  final void Function(EspansoReplaceField entry) onSubmitted;
  ReplaceFieldModel({
    required this.textController,
    required this.overlayLengthThreshold,
    required this.type,
    required this.onSubmitted,
  });
  int stackIndex = 0;

  bool get inlineEditable {
    if (textController.text.length > overlayLengthThreshold) {
      return false;
    }
    if (textController.text.contains('\n')) {
      return false;
    }
    return true;
  }

  bool? _showFocus;
  bool get showFocus => _showFocus ?? false;

  set showFocus(bool e) {
    _showFocus = e;
    !e ? stackIndex = 0 : {};
    !e ? debugPrint('EspansoLabelField: text submitted') : {};
    !e
        ? onSubmitted(
            EspansoReplaceField(text: textController.text, type: type))
        : {};
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
    onSubmitted(EspansoReplaceField(text: textController.text, type: type));
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
    onSubmitted(EspansoReplaceField(text: textController.text, type: type));
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
