import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'matches_details_model.dart';

class MatchesDetails extends StackedView<MatchesDetailsModel> {
  const MatchesDetails({super.key});

  @override
  Widget builder(
    BuildContext context,
    MatchesDetailsModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  MatchesDetailsModel viewModelBuilder(
    BuildContext context,
  ) =>
      MatchesDetailsModel();
}
