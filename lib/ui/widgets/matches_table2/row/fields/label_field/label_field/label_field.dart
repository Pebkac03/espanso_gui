import 'package:espanso_gui_v2/intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'label_field_model.dart';

class LabelField extends StackedView<LabelFieldModel> {
  final String entry;
  final double rowHeight;
  final double cellPadding;
  final double offWidth;
  final double focusWidthFactor;
  final Color offColor;
  final Color onColor;
  final TextStyle? textStyle;
  final void Function(String text) onSubmitted;

  static const double iconWidth = 50;

  const LabelField({
    super.key,
    required this.entry,
    required this.rowHeight,
    required this.cellPadding,
    required this.offWidth,
    this.focusWidthFactor = 2,
    required this.offColor,
    required this.onColor,
    this.textStyle,
    required this.onSubmitted,
  });

  @override
  Widget builder(
    BuildContext context,
    LabelFieldModel viewModel,
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

    // field's shortcuts
    final Map<ShortcutActivator, Intent> shortcuts = {
      const SingleActivator(LogicalKeyboardKey.enter): StartEditingIntent(),
      const SingleActivator(LogicalKeyboardKey.escape): StopEditingIntent()
    };

    // field's actions
    final Map<Type, Action<Intent>> actions = {
      StartEditingIntent:
          CallbackAction(onInvoke: (_) => viewModel.startEditing()),
      StopEditingIntent: CallbackAction(
        onInvoke: (intent) => viewModel.stopEditing(),
      )
    };

    final Widget widget = Expanded(
      child: GestureDetector(
        onTap: () => viewModel.startEditing(),
        child: FocusableActionDetector(
          shortcuts: shortcuts,
          actions: actions,
          descendantsAreTraversable: false,
          onShowFocusHighlight: (e) => viewModel.showFocus = e,
          child: Container(
            alignment: Alignment.centerLeft,
            height: rowHeight,
            padding: EdgeInsets.symmetric(horizontal: cellPadding, vertical: 0),
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(
                    width: viewModel.showFocus ? viewModel.onWidth : offWidth,
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
      ),
    );

    return widget;
  }

  @override
  LabelFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      LabelFieldModel(
        textController: TextEditingController(text: entry),
        onSubmitted: (text) {
          onSubmitted(text);
        },
        offWidth: offWidth,
        focusWidthFactor: focusWidthFactor,
      );
}
