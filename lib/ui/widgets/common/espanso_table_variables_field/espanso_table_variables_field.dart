import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'espanso_table_variables_field_model.dart';

class EspansoTableVariablesField
    extends StackedView<EspansoTableVariablesFieldModel> {
  const EspansoTableVariablesField({super.key});

  @override
  Widget builder(
    BuildContext context,
    EspansoTableVariablesFieldModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  EspansoTableVariablesFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      EspansoTableVariablesFieldModel();
}
