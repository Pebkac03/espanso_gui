import 'package:espanso_gui_v2/models/espanso_replace_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml_writer/yaml_writer.dart';

part 'espanso_replace_field.freezed.dart';

@freezed
class EspansoReplaceField with _$EspansoReplaceField {
  EspansoReplaceField._();

  factory EspansoReplaceField(
      {required String text,
      required EspansoReplaceType type}) = _EspansoReplaceField;

  toMap() => text;

  String get key => type.toString();
}
