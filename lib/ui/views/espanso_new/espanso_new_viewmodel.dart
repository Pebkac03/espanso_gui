import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/espanso_matches_service.dart';

class EspansoNewViewModel extends BaseViewModel {
  final EspansoMatchesService _matchesService =
      locator<EspansoMatchesService>();
  final ScrollController scrollController = ScrollController();
  Iterable<File>? _categories;
  Iterable<File> get categories => _categories ??= _matchesService.listFiles();
  void setPath(String path) {
    _matchesService.setPath(path);
    _categories = _matchesService.listFiles();
    rebuildUi();
  }

  Iterable<String> get titles =>
      categories.map((e) => e.path.split(r'\').last.replaceFirst('.yml', ''));

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
