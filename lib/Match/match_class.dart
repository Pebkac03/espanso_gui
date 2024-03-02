import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:quiver/collection.dart';
import 'package:yaml/yaml.dart';
import 'dart:io';

import 'Formfields/formfield_classes.dart';
import 'Variables/variable_classes.dart';

class EspansoMatches {
  final Map<String, List<EspansoMatch?>?>? matches;
  final List yaml;

  EspansoMatches._internal({required this.matches, required this.yaml});
  factory EspansoMatches(matches) {
    final yaml =
        matches; // continue here. Create function to convert matches to yamlFormat
    return EspansoMatches._internal(matches: {}, yaml: []);
  }
  factory EspansoMatches.fromYaml() {
    final String home = (Platform.environment['UserProfile'] ?? '') +
        r'\AppData\Roaming\espanso\match';
    // debugPrint('Espanso config path' + home);
    final Map<String, List<dynamic>> parsedYaml = {};
    final Map<String, List<EspansoMatch?>?>? parsedMatches = {};
    Directory(home).listSync().forEach((FileSystemEntity e) {
      if (e is File) {
        final name = e.path.split(r'\').last.replaceAll('.yml', '');
        parsedYaml[name] = loadYaml(e.readAsStringSync())['matches'];
        parsedMatches?[name] = parsedYaml[name]?.map((value) {
          return EspansoMatch.fromYaml(value);
          //parsedMatches[key]
        }).toList();
      }
    });
    return EspansoMatches._internal(matches: parsedMatches, yaml: []);
  }

  void add(index) {
    matches?[Category]!.insert(index, EspansoMatch(vars: []));
  }

  void remove(category, index) {
    matches?[category]!.removeAt(index);
  }

  void move(String category, int oldIndex, int newIndex) {
    if (matches?[category] != null) {
      final value = matches?[category]![oldIndex];
      if (newIndex < oldIndex) {
        matches?[category]!.removeAt(oldIndex);
        matches?[category]!.insert(newIndex, value);
      }
      if (newIndex > oldIndex) {
        matches?[category]!.removeAt(oldIndex);
        matches?[category]!.insert(newIndex - 1, value);
      }
    }
  }
}

class EspansoMatch {
  String? trigger;
  String replace;
  String label;
  bool form;
  bool propagateCase;
  bool capitaliseEachWord;
  bool triggerOnWord;
  List<dynamic>? vars;
  Map<String, EspansoFormField>? formFields;
  //add cursor hints functionality
  //add image functionality

  EspansoMatch({
    this.trigger, // string to trigger expansion
    this.replace = '', //what the trigger expands to
    this.form = false, //alternative to replace, opens a form to fill out
    this.label = '', //description for match
    this.propagateCase =
        false, //ex. alh - although, Alh - Although, ALH - ALTHOUGH
    this.capitaliseEachWord =
        false, //if propagateCase should capitalise each word
    this.triggerOnWord = false, //only trigger on matching word
    this.vars, //list of variables
    this.formFields, //optional arguments for form fields
  });

  factory EspansoMatch.fromYaml(YamlMap yaml) {
    bool form = false;

    String parseTrigger() {
      // debugPrint('parseTriggers' + yaml.toString());
      if (yaml.containsKey('trigger')) {
        return yaml['trigger'];
      } else {
        return yaml['triggers'][0];
      }
    }

    String parseReplace() {
      // debugPrint('parseReplace' + yaml.toString());
      if (yaml.containsKey('replace')) {
        return yaml['replace'];
      } else {
        form = true;
        return yaml['form'];
      }
    }

    String parseLabel() {
      // debugPrint('parseLabel' + yaml.toString());
      return yaml['label'].toString();
    }

    bool parsePropagateCase() {
      // debugPrint('parsePropagateCase' + yaml.toString());
      return bool.parse(yaml['propagate_case']?.toString() ?? 'false');
    }

    bool parseCapitaliseEachWord() {
      // debugPrint('parseCapitaliseEachWord' + yaml.toString());
      if (yaml['uppercase_style'] == 'capitalize_words') {
        return true;
      } else {
        return false;
      }
    }

    bool parseTriggerOnWord() {
      // debugPrint('parseTriggerOnWord' + yaml.toString());
      return yaml['word'] ?? false;
    }

    List<dynamic>? parseVars() {
      // debugPrint('parseVars' + yaml.toString());
      final List<dynamic>? result = yaml['vars']?.map((variable) {
        final Map params = variable['params'];
        final String name = variable['name'];
        // debugPrint('parsing a variable' + variable['type']);
        switch (variable['type']) {
          case 'date':
            return EspansoDateVariable(
                format: '',
                offset: params['offset'],
                locale: params['locale'],
                name: name);
          case 'choice':
            return EspansoChoiceVariable(choices: params['values'], name: name);
          case 'random':
            return EspansoRandomVariable(values: params['choices'], name: name);
          case 'clipboard':
            return EspansoClipboardVariable(name: name);
          case 'echo':
            return EspansoEchoVariable(text: params['echo'], name: name);
          case 'script':
            return EspansoScriptVariable(
                path: params['args'][1],
                scriptType: params['args'][0],
                name: name);
          case 'shell':
            return EspansoShellVariable(
                command: params['cmd'],
                name: name,
                trimOutput: bool.parse(params['trim']?.toString() ?? 'false'));
        }
      })?.toList();
      return result;
    }

    Map<String, EspansoFormField> parseFormFields() {
      // debugPrint('parseFormFields' + yaml.toString());
      final Map<String, EspansoFormField> values = {};
      yaml['form_fields']?.forEach((key, formfield) {
        if (formfield.containsKey('type')) {
          values[key] = EspansoFormChoiceField(
              name: key,
              alternatives: formfield['values'],
              appearance: formfield['type']);
        } else {
          values[key] = EspansoFormTextField(
              name: key,
              multiline: formfield['multiline'],
              defaultValue: formfield['default']);
        }
      });
      return values;
    }

    final String trigger = parseTrigger();
    final String replace = parseReplace();
    final String label = parseLabel();
    final bool propagateCase = parsePropagateCase();
    final bool capitaliseEachWord = parseCapitaliseEachWord();
    final bool triggerOnWord = parseTriggerOnWord();
    final List<dynamic>? vars = parseVars();
    final Map<String, EspansoFormField> formFields = parseFormFields();

    return EspansoMatch(
      trigger: trigger,
      replace: replace,
      label: label,
      form: form,
      propagateCase: propagateCase,
      capitaliseEachWord: capitaliseEachWord,
      triggerOnWord: triggerOnWord,
      vars: vars,
      formFields: formFields,
    );
  }
}
