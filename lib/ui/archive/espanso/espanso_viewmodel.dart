import 'dart:io';

import 'package:espanso_gui_v2/app/app.locator.dart';
import 'package:espanso_gui_v2/services/espanso_matches_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EspansoViewModel extends BaseViewModel {
  final EspansoMatchesService _matchesService =
      locator<EspansoMatchesService>();
  final ScrollController scrollController = ScrollController();
  Iterable<File>? _categories;
  Iterable<File> get categories => _categories ??= _matchesService.listFiles();

  Iterable<String> get titles =>
      categories.map((e) => e.path.split(r'\').last.replaceFirst('.yml', ''));

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
