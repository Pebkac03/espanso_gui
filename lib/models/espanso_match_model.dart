import 'package:espanso_gui_v2/models/espanso_replace_field.dart';
import 'package:espanso_gui_v2/models/espanso_replace_type.dart';
import 'package:espanso_gui_v2/models/espanso_trigger_field.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';

part 'espanso_match_model.freezed.dart';

@unfreezed
class EspansoMatch with _$EspansoMatch {
  EspansoMatch._();

  factory EspansoMatch({
    /// string to trigger expansion
    required EspansoTriggerField trigger,

    /// what the trigger expands to
    required EspansoReplaceField replace,

    /// The label to display as the match's identifier in UI elements.
    ///
    /// If empty, defaults to first trigger.
    required String label,

    /// ex. alh - although, Alh - Although, ALH - ALTHOUGH
    required bool propagateCase,

    /// if propagateCase should capitalize each word. `false` by default
    required bool titleCase,

    /// only trigger on matching word
    required bool onlyOnWord,

    /// list of variables
    required List<dynamic> variables,

    /// optional arguments for form fields
    // Map<String, EspansoFormField>? formFields
  }) = _EspansoMatch;

  /// converts and returns [EspansoMatch] as a [Map]
  ///
  /// converts values which are custom objects to dart maps if [recursive] is true
  Map toYaml() {
    final Map result = {
      trigger.type: trigger.toMap(),
      replace.key: replace.toMap(),
      'label': label,
      'propagate_case': propagateCase,
      'uppercase_style': titleCase ? 'capitalize_words' : null,
      'word': onlyOnWord ? true : null,
      'variables': [].isNotEmpty ? [] : null,
    };
    result.removeWhere((key, value) => value == null);
    return result;
  }

  /// Loads the match from a [YamlMap].
  factory EspansoMatch.fromYaml(YamlMap content) {
    debugPrint('factory EspansoMatch: factory constructor has been called');
    EspansoTriggerField parseTrigger(String? trigger, List<String>? triggers) {
      debugPrint('parseTrigger: parseTrigger was succesfully called');
      if (trigger != null) {
        return EspansoTriggerField(trigger: trigger.replaceAll('\n', ' '));
      }
      if (triggers != null) {
        return EspansoTriggerField(triggers: triggers);
      }
      debugPrint('parseTrigger: No trigger or triggers found');
      return EspansoTriggerField(trigger: '');
    }

    final EspansoTriggerField trigger =
        parseTrigger(content['trigger'], content['triggers']);

    EspansoReplaceField parseReplace(
        {String? replace, String? markdown, String? html, String? form}) {
      if (replace != null) {
        return EspansoReplaceField(
            text: replace, type: EspansoReplaceType.replace);
      }
      if (markdown != null) {
        return EspansoReplaceField(
            text: markdown, type: EspansoReplaceType.markdown);
      }
      if (html != null) {
        return EspansoReplaceField(text: html, type: EspansoReplaceType.html);
      }
      if (form != null) {
        return EspansoReplaceField(text: form, type: EspansoReplaceType.form);
      }

      throw 'no text found';
    }

    String parseLabel(String? label) {
      debugPrint('parseLabel: parseLabel was called');
      return label?.replaceAll('\n', ' ') ?? trigger.defaultLabel;
    }

    final String label = parseLabel(content['label']);

    bool parsePropagateCase(bool? propagateCase) {
      propagateCase ??= false;
      return propagateCase;
    }

    bool parseTitleCase(String? titleCase) {
      if (titleCase == 'capitalize_words') {
        return true;
      }
      return false;
    }

    bool parseOnlyOnWord(bool? onlyOnWord) {
      if (onlyOnWord == true) {
        return true;
      }
      return false;
    }

    debugPrint('factory EspansoMatch: all parse function passed successfully');

    return EspansoMatch(
        trigger: trigger,
        replace: parseReplace(
            replace: content['replace'],
            markdown: content['markdown'],
            html: content['html'],
            form: content['form']),
        label: label,
        propagateCase: parsePropagateCase(content['propagate_case']),
        titleCase: parseTitleCase(content['uppercase_style']),
        onlyOnWord: parseOnlyOnWord(content['word']),
        variables: []);
  }
}
