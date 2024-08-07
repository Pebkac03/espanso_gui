import 'dart:io';

import 'package:espanso_gui_v2/app/app.locator.dart';
import 'package:espanso_gui_v2/models/espanso_match_model.dart';
import 'package:espanso_gui_v2/services/espanso_matches_service.dart';
import 'package:stacked/stacked.dart';

class MatchesTable2Model extends BaseViewModel {
  final EspansoMatchesService _matchesService =
      locator<EspansoMatchesService>();
  final File file;
  MatchesTable2Model({required this.file});

  List<EspansoMatch>? _matches;
  List<EspansoMatch> get matches =>
      _matches ??= _matchesService.loadMatches(file);
  void save() {
    _matchesService.saveMatches(matches, file);
  }
}
