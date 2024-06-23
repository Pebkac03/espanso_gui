import 'package:espanso_gui_v2/intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'checkbox_field_model.dart';

class CheckboxField extends StackedView<CheckboxFieldModel> {
  final bool entry;
  final double rowHeight;
  final double cellPadding;
  final double offWidth;
  final double focusWidthFactor;
  final Color offColor;
  final Color onColor;
  final TextStyle? textStyle;
  final void Function(bool value) onSubmitted;

  static const double iconWidth = 50;

  const CheckboxField({
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
    CheckboxFieldModel viewModel,
    Widget? child,
  ) {
    final double onWidth = offWidth * focusWidthFactor;

    final Map<ShortcutActivator, Intent> shortcuts = {
      const SingleActivator(LogicalKeyboardKey.enter): ChangeCheckboxIntent(),
      const SingleActivator(LogicalKeyboardKey.space): ChangeCheckboxIntent(),
    };

    final Map<Type, Action<Intent>> actions = {
      ChangeCheckboxIntent:
          CallbackAction(onInvoke: (_) => viewModel.toggleCheckbox()),
    };

    return Expanded(
      child: FocusableActionDetector(
        descendantsAreTraversable: false,
        onShowFocusHighlight: (e) => viewModel.showFocus = e,
        shortcuts: shortcuts,
        actions: actions,
        child: Container(
          height: rowHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                  width: viewModel.showFocus ? onWidth : offWidth,
                  color: viewModel.showFocus ? onColor : offColor)),
          child: Checkbox(
            value: viewModel.checked,
            onChanged: (value) {
              viewModel.setCheckbox(value);
            },
          ),
        ),
      ),
    );
  }

  @override
  CheckboxFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      CheckboxFieldModel(onSubmitted: onSubmitted, initialValue: entry);
}
