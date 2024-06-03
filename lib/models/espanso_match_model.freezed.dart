// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'espanso_match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EspansoMatch {
  /// string to trigger expansion
  EspansoTriggerField get trigger => throw _privateConstructorUsedError;

  /// string to trigger expansion
  set trigger(EspansoTriggerField value) => throw _privateConstructorUsedError;

  /// what the trigger expands to
  EspansoReplaceField get replace => throw _privateConstructorUsedError;

  /// what the trigger expands to
  set replace(EspansoReplaceField value) => throw _privateConstructorUsedError;

  /// The label to display as the match's identifier in UI elements.
  ///
  /// If empty, defaults to first trigger.
  String get label => throw _privateConstructorUsedError;

  /// The label to display as the match's identifier in UI elements.
  ///
  /// If empty, defaults to first trigger.
  set label(String value) => throw _privateConstructorUsedError;

  /// ex. alh - although, Alh - Although, ALH - ALTHOUGH
  bool get propagateCase => throw _privateConstructorUsedError;

  /// ex. alh - although, Alh - Although, ALH - ALTHOUGH
  set propagateCase(bool value) => throw _privateConstructorUsedError;

  /// if propagateCase should capitalize each word. `false` by default
  bool get titleCase => throw _privateConstructorUsedError;

  /// if propagateCase should capitalize each word. `false` by default
  set titleCase(bool value) => throw _privateConstructorUsedError;

  /// only trigger on matching word
  bool get onlyOnWord => throw _privateConstructorUsedError;

  /// only trigger on matching word
  set onlyOnWord(bool value) => throw _privateConstructorUsedError;

  /// list of variables
  List<dynamic> get variables => throw _privateConstructorUsedError;

  /// list of variables
  set variables(List<dynamic> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EspansoMatchCopyWith<EspansoMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspansoMatchCopyWith<$Res> {
  factory $EspansoMatchCopyWith(
          EspansoMatch value, $Res Function(EspansoMatch) then) =
      _$EspansoMatchCopyWithImpl<$Res, EspansoMatch>;
  @useResult
  $Res call(
      {EspansoTriggerField trigger,
      EspansoReplaceField replace,
      String label,
      bool propagateCase,
      bool titleCase,
      bool onlyOnWord,
      List<dynamic> variables});

  $EspansoTriggerFieldCopyWith<$Res> get trigger;
  $EspansoReplaceFieldCopyWith<$Res> get replace;
}

/// @nodoc
class _$EspansoMatchCopyWithImpl<$Res, $Val extends EspansoMatch>
    implements $EspansoMatchCopyWith<$Res> {
  _$EspansoMatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trigger = null,
    Object? replace = null,
    Object? label = null,
    Object? propagateCase = null,
    Object? titleCase = null,
    Object? onlyOnWord = null,
    Object? variables = null,
  }) {
    return _then(_value.copyWith(
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as EspansoTriggerField,
      replace: null == replace
          ? _value.replace
          : replace // ignore: cast_nullable_to_non_nullable
              as EspansoReplaceField,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      propagateCase: null == propagateCase
          ? _value.propagateCase
          : propagateCase // ignore: cast_nullable_to_non_nullable
              as bool,
      titleCase: null == titleCase
          ? _value.titleCase
          : titleCase // ignore: cast_nullable_to_non_nullable
              as bool,
      onlyOnWord: null == onlyOnWord
          ? _value.onlyOnWord
          : onlyOnWord // ignore: cast_nullable_to_non_nullable
              as bool,
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EspansoTriggerFieldCopyWith<$Res> get trigger {
    return $EspansoTriggerFieldCopyWith<$Res>(_value.trigger, (value) {
      return _then(_value.copyWith(trigger: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EspansoReplaceFieldCopyWith<$Res> get replace {
    return $EspansoReplaceFieldCopyWith<$Res>(_value.replace, (value) {
      return _then(_value.copyWith(replace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EspansoMatchImplCopyWith<$Res>
    implements $EspansoMatchCopyWith<$Res> {
  factory _$$EspansoMatchImplCopyWith(
          _$EspansoMatchImpl value, $Res Function(_$EspansoMatchImpl) then) =
      __$$EspansoMatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EspansoTriggerField trigger,
      EspansoReplaceField replace,
      String label,
      bool propagateCase,
      bool titleCase,
      bool onlyOnWord,
      List<dynamic> variables});

  @override
  $EspansoTriggerFieldCopyWith<$Res> get trigger;
  @override
  $EspansoReplaceFieldCopyWith<$Res> get replace;
}

/// @nodoc
class __$$EspansoMatchImplCopyWithImpl<$Res>
    extends _$EspansoMatchCopyWithImpl<$Res, _$EspansoMatchImpl>
    implements _$$EspansoMatchImplCopyWith<$Res> {
  __$$EspansoMatchImplCopyWithImpl(
      _$EspansoMatchImpl _value, $Res Function(_$EspansoMatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trigger = null,
    Object? replace = null,
    Object? label = null,
    Object? propagateCase = null,
    Object? titleCase = null,
    Object? onlyOnWord = null,
    Object? variables = null,
  }) {
    return _then(_$EspansoMatchImpl(
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as EspansoTriggerField,
      replace: null == replace
          ? _value.replace
          : replace // ignore: cast_nullable_to_non_nullable
              as EspansoReplaceField,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      propagateCase: null == propagateCase
          ? _value.propagateCase
          : propagateCase // ignore: cast_nullable_to_non_nullable
              as bool,
      titleCase: null == titleCase
          ? _value.titleCase
          : titleCase // ignore: cast_nullable_to_non_nullable
              as bool,
      onlyOnWord: null == onlyOnWord
          ? _value.onlyOnWord
          : onlyOnWord // ignore: cast_nullable_to_non_nullable
              as bool,
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$EspansoMatchImpl extends _EspansoMatch {
  _$EspansoMatchImpl(
      {required this.trigger,
      required this.replace,
      required this.label,
      required this.propagateCase,
      required this.titleCase,
      required this.onlyOnWord,
      required this.variables})
      : super._();

  /// string to trigger expansion
  @override
  EspansoTriggerField trigger;

  /// what the trigger expands to
  @override
  EspansoReplaceField replace;

  /// The label to display as the match's identifier in UI elements.
  ///
  /// If empty, defaults to first trigger.
  @override
  String label;

  /// ex. alh - although, Alh - Although, ALH - ALTHOUGH
  @override
  bool propagateCase;

  /// if propagateCase should capitalize each word. `false` by default
  @override
  bool titleCase;

  /// only trigger on matching word
  @override
  bool onlyOnWord;

  /// list of variables
  @override
  List<dynamic> variables;

  @override
  String toString() {
    return 'EspansoMatch(trigger: $trigger, replace: $replace, label: $label, propagateCase: $propagateCase, titleCase: $titleCase, onlyOnWord: $onlyOnWord, variables: $variables)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EspansoMatchImplCopyWith<_$EspansoMatchImpl> get copyWith =>
      __$$EspansoMatchImplCopyWithImpl<_$EspansoMatchImpl>(this, _$identity);
}

abstract class _EspansoMatch extends EspansoMatch {
  factory _EspansoMatch(
      {required EspansoTriggerField trigger,
      required EspansoReplaceField replace,
      required String label,
      required bool propagateCase,
      required bool titleCase,
      required bool onlyOnWord,
      required List<dynamic> variables}) = _$EspansoMatchImpl;
  _EspansoMatch._() : super._();

  @override

  /// string to trigger expansion
  EspansoTriggerField get trigger;

  /// string to trigger expansion
  set trigger(EspansoTriggerField value);
  @override

  /// what the trigger expands to
  EspansoReplaceField get replace;

  /// what the trigger expands to
  set replace(EspansoReplaceField value);
  @override

  /// The label to display as the match's identifier in UI elements.
  ///
  /// If empty, defaults to first trigger.
  String get label;

  /// The label to display as the match's identifier in UI elements.
  ///
  /// If empty, defaults to first trigger.
  set label(String value);
  @override

  /// ex. alh - although, Alh - Although, ALH - ALTHOUGH
  bool get propagateCase;

  /// ex. alh - although, Alh - Although, ALH - ALTHOUGH
  set propagateCase(bool value);
  @override

  /// if propagateCase should capitalize each word. `false` by default
  bool get titleCase;

  /// if propagateCase should capitalize each word. `false` by default
  set titleCase(bool value);
  @override

  /// only trigger on matching word
  bool get onlyOnWord;

  /// only trigger on matching word
  set onlyOnWord(bool value);
  @override

  /// list of variables
  List<dynamic> get variables;

  /// list of variables
  set variables(List<dynamic> value);
  @override
  @JsonKey(ignore: true)
  _$$EspansoMatchImplCopyWith<_$EspansoMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
