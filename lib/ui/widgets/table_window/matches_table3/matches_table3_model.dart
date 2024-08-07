import 'dart:io';

import 'package:espanso_gui_v2/app/app.locator.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/espanso_match_model.dart';
import '../../../../services/espanso_matches_service.dart';

class MatchesTable3Model extends BaseViewModel {
  final EspansoMatchesService _matchesService =
      locator<EspansoMatchesService>();
  final File file;

  MatchesTable3Model({required this.file});

  List<EspansoMatch>? _matches;
  List<EspansoMatch> get matches =>
      _matches ??= _matchesService.loadMatches(file);
  void save() {
    _matchesService.saveMatches(matches, file);
  }
}
