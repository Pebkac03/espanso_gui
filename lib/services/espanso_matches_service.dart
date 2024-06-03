import 'dart:io';

import 'package:espanso_gui_v2/app/app.locator.dart';
import 'package:espanso_gui_v2/models/espanso_match_model.dart';
import 'package:espanso_gui_v2/services/file_service.dart';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

class EspansoMatchesService {
  final _fileService = locator<FileService>();
  final _path = (Platform.environment['UserProfile'] ?? '') +
      r'\AppData\Roaming\espanso\match';
  final _yamlWriter = YamlWriter();

  Map<String, List<EspansoMatch>> loadAllMatches() {
    debugPrint('loaded all matches');
    Iterable<File> raw = _fileService.loadFiles(_path, true);
    Map<String, List<EspansoMatch>> matches = {}..addEntries(raw.map((e) {
        final String key = e.path.split(r'\').last.replaceAll('.yml', '');
        final List<EspansoMatch> value =
            loadYaml(e.readAsStringSync())['matches']
                .map((e) => EspansoMatch.fromYaml(e));
        return MapEntry(key, value);
      }));
    return matches;
  }

  Iterable<File> listFiles() => _fileService.loadFiles(_path, true);

  List<EspansoMatch> loadMatches(File file) {
    return loadYaml(file.readAsStringSync())['matches']
        .map((e) => EspansoMatch.fromYaml(e))
        .toList()
        .cast<EspansoMatch>();
  }

  /*
  void saveAllMatches(Map<String, List<EspansoMatch>> matches) {
    matches.forEach((key, value) {
      _fileService.saveFile(
          path: '{$_path}\\$key.yml',
          contents: _yamlWriter
              .write({'matches': value.map((e) => e.toMap(recursive: true))}));
    });
  }
  */

  // disabled until tested
  void saveMatches(List<EspansoMatch> matches, File file) {
    debugPrint('saveMatches: saveMatches was called');

    _fileService.saveFile(
        file: file,
        contents: _yamlWriter
            .write({'matches': matches.map((e) => e.toYaml()).toList()}));
  }
}
