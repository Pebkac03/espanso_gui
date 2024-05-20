import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'espanso_table_replace_field_model.dart';

class EspansoTableReplaceField
    extends StackedView<EspansoTableReplaceFieldModel> {
  const EspansoTableReplaceField({super.key});

  @override
  Widget builder(
    BuildContext context,
    EspansoTableReplaceFieldModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  EspansoTableReplaceFieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      EspansoTableReplaceFieldModel();
}
