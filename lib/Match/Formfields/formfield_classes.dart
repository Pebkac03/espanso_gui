import 'package:yaml/yaml.dart';

class EspansoFormField {}

class EspansoFormChoiceField extends EspansoFormField {
  final String name;
  final YamlList alternatives;
  final String appearance;

  EspansoFormChoiceField(
      {required this.name,
      required this.alternatives,
      this.appearance = 'choice'})
      : assert((appearance == 'list' || appearance == 'choice'),
            'Needs to be either "list" or "choice"');

  Map toYamlFormat() {
    return {
      name: {'type': appearance, 'values': alternatives}
    };
  }
}

class EspansoFormTextField extends EspansoFormField {
  final String name;
  final bool multiline;
  final String defaultValue;

  EspansoFormTextField(
      {required this.name, required this.multiline, this.defaultValue = ''});

  Map toYamlFormat() {
    return {
      name: {'multiline': multiline, 'default': defaultValue}
    };
  }
}
