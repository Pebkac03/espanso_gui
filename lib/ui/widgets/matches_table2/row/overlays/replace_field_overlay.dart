import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'replace_field_overlay_model.dart';

class ReplaceFieldOverlay extends StackedView<ReplaceFieldOverlayModel> {
  final TextEditingController? controller;
  const ReplaceFieldOverlay({super.key, this.controller});

  @override
  Widget builder(
    BuildContext context,
    ReplaceFieldOverlayModel viewModel,
    Widget? child,
  ) {
    return Column(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            maxLines: null,
            expands: true,
          ),
        )
      ],
    );
  }

  @override
  ReplaceFieldOverlayModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReplaceFieldOverlayModel();
}
