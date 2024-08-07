// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'espanso_replace_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EspansoReplaceField {
  String get text => throw _privateConstructorUsedError;
  EspansoReplaceType get type => throw _privateConstructorUsedError;

  /// Create a copy of EspansoReplaceField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EspansoReplaceFieldCopyWith<EspansoReplaceField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspansoReplaceFieldCopyWith<$Res> {
  factory $EspansoReplaceFieldCopyWith(
          EspansoReplaceField value, $Res Function(EspansoReplaceField) then) =
      _$EspansoReplaceFieldCopyWithImpl<$Res, EspansoReplaceField>;
  @useResult
  $Res call({String text, EspansoReplaceType type});
}

/// @nodoc
class _$EspansoReplaceFieldCopyWithImpl<$Res, $Val extends EspansoReplaceField>
    implements $EspansoReplaceFieldCopyWith<$Res> {
  _$EspansoReplaceFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EspansoReplaceField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EspansoReplaceType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EspansoReplaceFieldImplCopyWith<$Res>
    implements $EspansoReplaceFieldCopyWith<$Res> {
  factory _$$EspansoReplaceFieldImplCopyWith(_$EspansoReplaceFieldImpl value,
          $Res Function(_$EspansoReplaceFieldImpl) then) =
      __$$EspansoReplaceFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, EspansoReplaceType type});
}

/// @nodoc
class __$$EspansoReplaceFieldImplCopyWithImpl<$Res>
    extends _$EspansoReplaceFieldCopyWithImpl<$Res, _$EspansoReplaceFieldImpl>
    implements _$$EspansoReplaceFieldImplCopyWith<$Res> {
  __$$EspansoReplaceFieldImplCopyWithImpl(_$EspansoReplaceFieldImpl _value,
      $Res Function(_$EspansoReplaceFieldImpl) _then)
      : super(_value, _then);

  /// Create a copy of EspansoReplaceField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
  }) {
    return _then(_$EspansoReplaceFieldImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EspansoReplaceType,
    ));
  }
}

/// @nodoc

class _$EspansoReplaceFieldImpl extends _EspansoReplaceField {
  _$EspansoReplaceFieldImpl({required this.text, required this.type})
      : super._();

  @override
  final String text;
  @override
  final EspansoReplaceType type;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EspansoReplaceFieldImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, type);

  /// Create a copy of EspansoReplaceField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EspansoReplaceFieldImplCopyWith<_$EspansoReplaceFieldImpl> get copyWith =>
      __$$EspansoReplaceFieldImplCopyWithImpl<_$EspansoReplaceFieldImpl>(
          this, _$identity);
}

abstract class _EspansoReplaceField extends EspansoReplaceField {
  factory _EspansoReplaceField(
      {required final String text,
      required final EspansoReplaceType type}) = _$EspansoReplaceFieldImpl;
  _EspansoReplaceField._() : super._();

  @override
  String get text;
  @override
  EspansoReplaceType get type;

  /// Create a copy of EspansoReplaceField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EspansoReplaceFieldImplCopyWith<_$EspansoReplaceFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
