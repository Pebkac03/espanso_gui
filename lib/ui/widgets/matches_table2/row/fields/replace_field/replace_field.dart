import 'package:espanso_gui_v2/intents.dart';
import 'package:espanso_gui_v2/models/espanso_replace_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'replace_field_model.dart';

class ReplaceField extends StackedView<ReplaceFieldModel> {
  final EspansoReplaceField value;
  final double rowHeight;
  final double cellPadding;
  final double offWidth;
  final double focusWidthFactor;
  final Color offColor;
  final Color onColor;
  final TextStyle? textStyle;
  final int overlayLengthThreshold;
  final Widget? Function(TextEditingController controller) overlay;
  final void Function(EspansoReplaceField entry) onSubmitted;

  static const double iconWidth = 50;

  // TODO: add default overlay
  const ReplaceField({
    super.key,
    required this.value,
    required this.rowHeight,
    required this.cellPadding,
    required this.offWidth,
    this.focusWidthFactor = 2,
    required this.offColor,
    required this.onColor,
    this.textStyle,
    this.overlayLengthThreshold = 100,
    required this.overlay,
    required this.onSubmitted,
  });

  @override
  Widget builder(
    BuildContext context,
    ReplaceFieldModel viewModel,
    Widget? child,
  ) {
    final double onWidth = focusWidthFactor * 2;

    // the widget which is shown when the field is focused
    final Widget focusedChild = TextField(
      style: textStyle,
      controller: viewModel.textController,
      focusNode: viewModel.textFocus,
      textAlignVertical: TextAlignVertical.center,
      maxLines: 1,
      decoration: const InputDecoration(
        isDense: true,
        filled: false,
        border: InputBorder.none,
      ),
    );

    // the widget which is shown when the field isn't focused
    final Widget unfocusedChild = Text(
      maxLines: 1,
      viewModel.textController.text,
      overflow: TextOverflow.ellipsis,
      style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
    );

    final Widget widget = GestureDetector(
      onTap: () => viewModel.inlineEditable ? viewModel.startEditing() : {},
      child: FocusableActionDetector(
        shortcuts: {
          const SingleActivator(LogicalKeyboardKey.enter):
              viewModel.inlineEditable
                  ? StartEditingIntent()
                  : ShowOverlayIntent(),
          const SingleActivator(LogicalKeyboardKey.escape): StopEditingIntent()
        },
        actions: {
          ShowOverlayIntent:
              CallbackAction(onInvoke: (_) => viewModel.showOverlay()),
          StartEditingIntent:
              CallbackAction(onInvoke: (_) => viewModel.startEditing()),
          StopEditingIntent: CallbackAction(
            onInvoke: (intent) => viewModel.stopEditing(),
          )
        },
        descendantsAreTraversable: false,
        onShowFocusHighlight: (e) => viewModel.showFocus = e,
        child: Container(
          alignment: Alignment.centerLeft,
          height: rowHeight,
          padding: EdgeInsets.symmetric(horizontal: cellPadding, vertical: 0),
          decoration: BoxDecoration(
              border: Border.all(
                  width: viewModel.showFocus ? onWidth : offWidth,
                  color: viewModel.showFocus ? onColor : offColor)),
          child: MouseRegion(
            cursor: viewModel.inlineEditable
                ? SystemMouseCursors.text
                : SystemMouseCursors.basic,
            child: Row(children: [
              Expanded(
                  child: IndexedStack(
                index: viewModel.stackIndex,
                children: [unfocusedChild, focusedChild],
              )),
              SizedBox(
                width: iconWidth,
                child: IconButton(
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    onPressed: () => viewModel.showOverlay(),
                    icon: const Icon(Icons.open_in_new)),
              )
            ]),
          ),
        ),
      ),
    );

    return Expanded(
      child: OverlayPortal(
          controller: viewModel.overlayController,
          child: widget,
          overlayChildBuilder: (context) => TapRegion(
                onTapOutside: (e) => viewModel.hideOverlay(),
                child: CallbackShortcuts(
                  bindings: {
                    const SingleActivator(LogicalKeyboardKey.escape): () =>
                        viewModel.hideOverlay()
                  },
                  child: Row(
                    children: [
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration:
                              BoxDecoration(boxShadow: kElevationToShadow[12]),
                          child: Container(
                              color: Colors.white,
                              child: overlay(viewModel.textController)),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }

  @override
  ReplaceFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReplaceFieldModel(
        textController: TextEditingController(text: value.text),
        overlayLengthThreshold: overlayLengthThreshold,
        type: value.type,
        onSubmitted: (entry) {
          onSubmitted(entry);
        },
      );
}
