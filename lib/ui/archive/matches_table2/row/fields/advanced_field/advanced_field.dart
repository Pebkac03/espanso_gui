import 'package:espanso_gui_v2/intents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'advanced_field_model.dart';

class AdvancedField extends StackedView<AdvancedFieldModel> {
  final bool entry;
  final double rowHeight;
  final double cellPadding;
  final double offWidth;
  final double focusWidthFactor;
  final Color offColor;
  final Color onColor;
  final TextStyle? textStyle;
  final void Function(bool value) onSubmitted;
  final void Function(bool value) onDropdown;

  static const double iconWidth = 50;

  const AdvancedField({
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
    required this.onDropdown,
  });

  @override
  Widget builder(
    BuildContext context,
    AdvancedFieldModel viewModel,
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
          child: Row(
            children: [
              Expanded(
                child: Checkbox(
                  value: viewModel.checked,
                  onChanged: (value) {
                    viewModel.setCheckbox(value);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: viewModel.checked
                      ? () {
                          viewModel.showAdvancedMenu =
                              !viewModel.showAdvancedMenu;
                        }
                      : null,
                  icon: Icon(viewModel.showAdvancedMenu
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  AdvancedFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdvancedFieldModel(
          onSubmitted: onSubmitted,
          onDropdown: onDropdown,
          initialValue: entry);
}
