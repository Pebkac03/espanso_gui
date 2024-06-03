import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'espanso_trigger_field.freezed.dart';

@unfreezed
class EspansoTriggerField with _$EspansoTriggerField {
  EspansoTriggerField._();

  // add assert to require either trigger or triggers
  factory EspansoTriggerField({
    String? trigger,
    List<String>? triggers,
  }) = _EspansoTriggerField;

  toMap() => trigger ?? jsonEncode(triggers);

  String get type => triggers == null ? 'trigger' : 'triggers';

  @override
  String toString() => triggers?.first ?? trigger ?? '';

  String get defaultLabel {
    debugPrint('get defaultLabel: getter for default label has been called');
    // see if you can remove null check when assert has been added
    return toString();
  }
}
