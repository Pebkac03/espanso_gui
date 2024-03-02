import 'dart:ui';

import 'package:yaml/yaml.dart';

class EspansoVariable {
  final String name;

  EspansoVariable({required this.name});
}

class EspansoDateVariable extends EspansoVariable {
  static String type = 'date';

  final String format;
  final Duration? offset;
  final Locale? locale;

  EspansoDateVariable(
      {required this.format, this.offset, this.locale, required super.name});

  Map<String, dynamic> toYamlFormat() {
    final Map<String, dynamic> params = {
      'format': format,
      'offset': offset,
      'locale': locale,
    };
    params.removeWhere((key, value) => value == null);

    final value = {'name': name, 'type': type, 'params': params};
    return value;
  }
}

class EspansoChoiceVariable extends EspansoVariable {
  static String type = 'choice';
  final List<Map<String, String>> choices;

  EspansoChoiceVariable({required this.choices, required super.name});

  Map toYamlFormat() {
    return {
      'name': name,
      'type': type,
      'params': {
        'choices': choices,
      }
    };
  }
}

class EspansoRandomVariable extends EspansoVariable {
  static String type = 'random';
  final YamlList values;

  EspansoRandomVariable({required this.values, required super.name});

  Map toYamlFormat() {
    return {
      'name': name,
      'type': type,
      'params': {
        'values': values,
      }
    };
  }
}

class EspansoClipboardVariable extends EspansoVariable {
  static String type = 'clipboard';

  EspansoClipboardVariable({required super.name});

  Map toYamlFormat() {
    return {
      'name': name,
      'type': type,
    };
  }
}

class EspansoEchoVariable extends EspansoVariable {
  static String type = 'echo';
  final String text;

  EspansoEchoVariable({required this.text, required super.name});

  Map toYamlFormat() {
    return {
      'name': name,
      'type': type,
      'params': {
        'echo': text,
      }
    };
  }
}

class EspansoScriptVariable extends EspansoVariable {
  static const String type = 'script';

  final String scriptType;
  final String path;

  EspansoScriptVariable(
      {required this.path, required this.scriptType, required super.name});

  Map toYamlFormat() {
    return {
      'name': name,
      'type': type,
      'params': {
        'args': [scriptType, path],
      }
    };
  }
}

class EspansoShellVariable extends EspansoVariable {
  static const String type = 'shell';

  final String command;
  final bool trimOutput;

  EspansoShellVariable(
      {required this.command, this.trimOutput = true, required super.name});

  Map toYamlFormat() {
    return {
      'name': name,
      'type': type,
      'params': {'cmd': command, 'trim': trimOutput}
    };
  }
}
