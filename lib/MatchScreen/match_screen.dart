import 'package:espanso_gui/MatchScreen/MatchCategories/match_categories_widget.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Row(
      children: [MatchCategoriesWidget()],
    );
  }
}
