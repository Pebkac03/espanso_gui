import 'dart:io';

import 'package:flutter/material.dart';

class FileService {
  Iterable<File> loadFiles(String path, bool recursive) {
    debugPrint(path);
    final Iterable<File> result = Directory(path)
        .listSync(recursive: recursive)
        .map((FileSystemEntity e) {
      if (e is File) {
        return e;
      }
    }).nonNulls;
    debugPrint('$result');
    return result;
  }

  void saveFile({required File file, required String contents}) {
    file.writeAsString(contents);
  }
}
