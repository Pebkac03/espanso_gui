import 'package:espanso_gui/Match/match_widget.dart';
import 'package:espanso_gui/MatchScreen/MatchCategories/match_categories_widget.dart';
import 'package:flutter/material.dart';

import '../Match/match_class.dart';

class MatchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [MatchCategoriesWidget()],
    );
  }
}
