import 'dart:io';

import 'package:espanso_gui_v2/app/app.locator.dart';
import 'package:espanso_gui_v2/models/espanso_match_model.dart';
import 'package:espanso_gui_v2/services/espanso_matches_service.dart';
import 'package:espanso_gui_v2/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:stacked/stacked.dart';

class MatchesTableModel extends BaseViewModel {
  final _espansoMatchesService = locator<EspansoMatchesService>();
  final _themeService = locator<ThemeService>();
  // final _themeService = locator<StackedTheme>;
  List<EspansoMatch> _matches = [];
  List<PlutoRow>? _rows;

  final File file;

  MatchesTableModel(this.file);

  ThemeData get theme => _themeService.theme;
  List<PlutoRow> get rows {
    if (_rows == null) {
      debugPrint('_rows is null');
    } else {
      debugPrint('_rows is not null');
    }
    return _rows ??= _getRows();
  }

  List<PlutoRow> _getRows() {
    debugPrint('getRows: get rows was called');
    final List<PlutoRow> result = getMatches(file).map((match) {
      final PlutoRow subResult = PlutoRow(cells: {
        'label': PlutoCell(value: match.label),
        // add triggers functionality
        'trigger': PlutoCell(value: match.trigger.trigger),
        'replace': PlutoCell(value: match.replace.text),
        'titleCase': PlutoCell(value: match.titleCase),
        'propagateCase': PlutoCell(value: match.propagateCase),
        'onlyOnWord': PlutoCell(value: match.onlyOnWord)
      });
      return subResult;
    }).toList();
    debugPrint('getRows: get rows passed successfully');
    return result;
  }

  _updateRow(index) {
    final EspansoMatch match = _matches[index];
    return PlutoRow(cells: {
      'label': PlutoCell(value: match.label),
      // add triggers functionality
      'trigger': PlutoCell(value: match.trigger.trigger),
      'replace': PlutoCell(value: match.replace.text),
      'titleCase': PlutoCell(value: match.titleCase),
      'propagateCase': PlutoCell(value: match.propagateCase),
      'onlyOnWord': PlutoCell(value: match.onlyOnWord)
    });
  }

  List<EspansoMatch> getMatches(File file) {
    if (_matches.isNotEmpty) {
      debugPrint('getMatches:  _matches was not empty');
      return _matches;
    } else {
      _matches = _espansoMatchesService.loadMatches(file);
      debugPrint('getMatches:  _matches was empty');
      return _matches;
    }
  }

  void addMatch(File file, EspansoMatch match) {
    _matches.add(match);
  }

  void updateTitleCase(int index, bool value) {
    debugPrint('updateTitleCase: Updated title case to $value');
    _matches[index] = _matches[index].copyWith(titleCase: value);
    _rows?[index] = _updateRow(index);
    rebuildUi();
  }

  void updatePropagateCase(int index, bool value) {
    debugPrint('propagateCase: Updated propagateCase to $value');
    _matches[index] = _matches[index].copyWith(propagateCase: value);
    _rows?[index] = _updateRow(index);
    rebuildUi();
  }

  void updateOnlyOnWord(int index, bool value) {
    debugPrint('onlyOnWord: Updated Require Word to $value');
    _matches[index] = _matches[index].copyWith(onlyOnWord: value);
    _rows?[index] = _updateRow(index);
    rebuildUi();
  }

  void removeMatch(File file, int index) {
    _matches.removeAt(index);
  }

  void saveMatches() {
    _espansoMatchesService.saveMatches(_matches, file);
  }
}
