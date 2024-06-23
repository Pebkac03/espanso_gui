import 'package:espanso_gui_v2/intents.dart';
import 'package:espanso_gui_v2/models/espanso_trigger_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'trigger_field_model.dart';

class TriggerField extends StackedView<TriggerFieldModel> {
  final EspansoTriggerField entry;
  final double rowHeight;
  final double cellPadding;
  final double onWidth;
  final double offWidth;
  final Color offColor;
  final Color onColor;
  final TextStyle? textStyle;
  final int overlayLengthThreshold;
  final Widget? Function(TextEditingController controller) overlay;
  final void Function(EspansoTriggerField entry) onSubmitted;

  static const double iconWidth = 50;

  // TODO: add default overlay
  const TriggerField._internal({
    super.key,
    required this.entry,
    required this.rowHeight,
    required this.cellPadding,
    required this.offWidth,
    required this.onWidth,
    required this.offColor,
    required this.onColor,
    this.textStyle,
    required this.overlayLengthThreshold,
    required this.overlay,
    required this.onSubmitted,
  });

  factory TriggerField({
    required EspansoTriggerField entry,
    required double rowHeight,
    required double cellPadding,
    required double offWidth,
    double? onWidth,
    Color offColor = Colors.black,
    Color onColor = Colors.lightBlue,
    TextStyle? textStyle,
    int overlayLengthThreshold = 100,
    required Widget? Function(TextEditingController controller) overlay,
    required void Function(EspansoTriggerField entry) onSubmitted,
    bool multiline = false,
  }) {
    return TriggerField._internal(
      entry: entry,
      rowHeight: rowHeight,
      cellPadding: cellPadding,
      offWidth: offWidth,
      onWidth: onWidth ?? offWidth * 2,
      offColor: offColor,
      onColor: onColor,
      textStyle: textStyle,
      overlayLengthThreshold: overlayLengthThreshold,
      overlay: overlay,
      onSubmitted: onSubmitted,
    );
  }

  @override
  Widget builder(
    BuildContext context,
    TriggerFieldModel viewModel,
    Widget? child,
  ) {
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
      onTap: () => viewModel.startEditing(),
      child: FocusableActionDetector(
        shortcuts: {
          const SingleActivator(LogicalKeyboardKey.enter): StartEditingIntent(),
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
            cursor: SystemMouseCursors.text,
            child: IndexedStack(
              index: viewModel.stackIndex,
              children: [unfocusedChild, focusedChild],
            ),
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
  TriggerFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      TriggerFieldModel(
        textController: TextEditingController(text: entry.trigger),
        overlayLengthThreshold: overlayLengthThreshold,
        onSubmitted: (entry) {
          onSubmitted(entry);
        },
      );
}
