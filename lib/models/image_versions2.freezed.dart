// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_versions2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageVersions2 _$ImageVersions2FromJson(Map<String, dynamic> json) {
  return _ImageVersions2.fromJson(json);
}

/// @nodoc
mixin _$ImageVersions2 {
  List<Candidate> get candidates => throw _privateConstructorUsedError;

  /// Serializes this ImageVersions2 to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageVersions2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageVersions2CopyWith<ImageVersions2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageVersions2CopyWith<$Res> {
  factory $ImageVersions2CopyWith(
          ImageVersions2 value, $Res Function(ImageVersions2) then) =
      _$ImageVersions2CopyWithImpl<$Res, ImageVersions2>;
  @useResult
  $Res call({List<Candidate> candidates});
}

/// @nodoc
class _$ImageVersions2CopyWithImpl<$Res, $Val extends ImageVersions2>
    implements $ImageVersions2CopyWith<$Res> {
  _$ImageVersions2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageVersions2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
  }) {
    return _then(_value.copyWith(
      candidates: null == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageVersions2ImplCopyWith<$Res>
    implements $ImageVersions2CopyWith<$Res> {
  factory _$$ImageVersions2ImplCopyWith(_$ImageVersions2Impl value,
          $Res Function(_$ImageVersions2Impl) then) =
      __$$ImageVersions2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Candidate> candidates});
}

/// @nodoc
class __$$ImageVersions2ImplCopyWithImpl<$Res>
    extends _$ImageVersions2CopyWithImpl<$Res, _$ImageVersions2Impl>
    implements _$$ImageVersions2ImplCopyWith<$Res> {
  __$$ImageVersions2ImplCopyWithImpl(
      _$ImageVersions2Impl _value, $Res Function(_$ImageVersions2Impl) _then)
      : super(_value, _then);

  /// Create a copy of ImageVersions2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
  }) {
    return _then(_$ImageVersions2Impl(
      candidates: null == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageVersions2Impl implements _ImageVersions2 {
  const _$ImageVersions2Impl({required final List<Candidate> candidates})
      : _candidates = candidates;

  factory _$ImageVersions2Impl.fromJson(Map<String, dynamic> json) =>
      _$$ImageVersions2ImplFromJson(json);

  final List<Candidate> _candidates;
  @override
  List<Candidate> get candidates {
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_candidates);
  }

  @override
  String toString() {
    return 'ImageVersions2(candidates: $candidates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageVersions2Impl &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_candidates));

  /// Create a copy of ImageVersions2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageVersions2ImplCopyWith<_$ImageVersions2Impl> get copyWith =>
      __$$ImageVersions2ImplCopyWithImpl<_$ImageVersions2Impl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageVersions2ImplToJson(
      this,
    );
  }
}

abstract class _ImageVersions2 implements ImageVersions2 {
  const factory _ImageVersions2({required final List<Candidate> candidates}) =
      _$ImageVersions2Impl;

  factory _ImageVersions2.fromJson(Map<String, dynamic> json) =
      _$ImageVersions2Impl.fromJson;

  @override
  List<Candidate> get candidates;

  /// Create a copy of ImageVersions2
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageVersions2ImplCopyWith<_$ImageVersions2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
