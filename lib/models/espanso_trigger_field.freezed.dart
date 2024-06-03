// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'espanso_trigger_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EspansoTriggerField {
  String? get trigger => throw _privateConstructorUsedError;
  set trigger(String? value) => throw _privateConstructorUsedError;
  List<String>? get triggers => throw _privateConstructorUsedError;
  set triggers(List<String>? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EspansoTriggerFieldCopyWith<EspansoTriggerField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspansoTriggerFieldCopyWith<$Res> {
  factory $EspansoTriggerFieldCopyWith(
          EspansoTriggerField value, $Res Function(EspansoTriggerField) then) =
      _$EspansoTriggerFieldCopyWithImpl<$Res, EspansoTriggerField>;
  @useResult
  $Res call({String? trigger, List<String>? triggers});
}

/// @nodoc
class _$EspansoTriggerFieldCopyWithImpl<$Res, $Val extends EspansoTriggerField>
    implements $EspansoTriggerFieldCopyWith<$Res> {
  _$EspansoTriggerFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trigger = freezed,
    Object? triggers = freezed,
  }) {
    return _then(_value.copyWith(
      trigger: freezed == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String?,
      triggers: freezed == triggers
          ? _value.triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspansoTriggerFieldImplCopyWith<$Res>
    implements $EspansoTriggerFieldCopyWith<$Res> {
  factory _$$EspansoTriggerFieldImplCopyWith(_$EspansoTriggerFieldImpl value,
          $Res Function(_$EspansoTriggerFieldImpl) then) =
      __$$EspansoTriggerFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? trigger, List<String>? triggers});
}

/// @nodoc
class __$$EspansoTriggerFieldImplCopyWithImpl<$Res>
    extends _$EspansoTriggerFieldCopyWithImpl<$Res, _$EspansoTriggerFieldImpl>
    implements _$$EspansoTriggerFieldImplCopyWith<$Res> {
  __$$EspansoTriggerFieldImplCopyWithImpl(_$EspansoTriggerFieldImpl _value,
      $Res Function(_$EspansoTriggerFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trigger = freezed,
    Object? triggers = freezed,
  }) {
    return _then(_$EspansoTriggerFieldImpl(
      trigger: freezed == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String?,
      triggers: freezed == triggers
          ? _value.triggers
          : triggers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$EspansoTriggerFieldImpl extends _EspansoTriggerField {
  _$EspansoTriggerFieldImpl({this.trigger, this.triggers}) : super._();

  @override
  String? trigger;
  @override
  List<String>? triggers;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspansoTriggerFieldImplCopyWith<_$EspansoTriggerFieldImpl> get copyWith =>
      __$$EspansoTriggerFieldImplCopyWithImpl<_$EspansoTriggerFieldImpl>(
          this, _$identity);
}

abstract class _EspansoTriggerField extends EspansoTriggerField {
  factory _EspansoTriggerField({String? trigger, List<String>? triggers}) =
      _$EspansoTriggerFieldImpl;
  _EspansoTriggerField._() : super._();

  @override
  String? get trigger;
  set trigger(String? value);
  @override
  List<String>? get triggers;
  set triggers(List<String>? value);
  @override
  @JsonKey(ignore: true)
  _$$EspansoTriggerFieldImplCopyWith<_$EspansoTriggerFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
