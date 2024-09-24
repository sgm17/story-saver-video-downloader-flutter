// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cropped_image_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CroppedImageVersion _$CroppedImageVersionFromJson(Map<String, dynamic> json) {
  return _CroppedImageVersion.fromJson(json);
}

/// @nodoc
mixin _$CroppedImageVersion {
  String get url => throw _privateConstructorUsedError;

  /// Serializes this CroppedImageVersion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CroppedImageVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CroppedImageVersionCopyWith<CroppedImageVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CroppedImageVersionCopyWith<$Res> {
  factory $CroppedImageVersionCopyWith(
          CroppedImageVersion value, $Res Function(CroppedImageVersion) then) =
      _$CroppedImageVersionCopyWithImpl<$Res, CroppedImageVersion>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$CroppedImageVersionCopyWithImpl<$Res, $Val extends CroppedImageVersion>
    implements $CroppedImageVersionCopyWith<$Res> {
  _$CroppedImageVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CroppedImageVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CroppedImageVersionImplCopyWith<$Res>
    implements $CroppedImageVersionCopyWith<$Res> {
  factory _$$CroppedImageVersionImplCopyWith(_$CroppedImageVersionImpl value,
          $Res Function(_$CroppedImageVersionImpl) then) =
      __$$CroppedImageVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$CroppedImageVersionImplCopyWithImpl<$Res>
    extends _$CroppedImageVersionCopyWithImpl<$Res, _$CroppedImageVersionImpl>
    implements _$$CroppedImageVersionImplCopyWith<$Res> {
  __$$CroppedImageVersionImplCopyWithImpl(_$CroppedImageVersionImpl _value,
      $Res Function(_$CroppedImageVersionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CroppedImageVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$CroppedImageVersionImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CroppedImageVersionImpl implements _CroppedImageVersion {
  const _$CroppedImageVersionImpl({required this.url});

  factory _$CroppedImageVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CroppedImageVersionImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'CroppedImageVersion(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CroppedImageVersionImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of CroppedImageVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CroppedImageVersionImplCopyWith<_$CroppedImageVersionImpl> get copyWith =>
      __$$CroppedImageVersionImplCopyWithImpl<_$CroppedImageVersionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CroppedImageVersionImplToJson(
      this,
    );
  }
}

abstract class _CroppedImageVersion implements CroppedImageVersion {
  const factory _CroppedImageVersion({required final String url}) =
      _$CroppedImageVersionImpl;

  factory _CroppedImageVersion.fromJson(Map<String, dynamic> json) =
      _$CroppedImageVersionImpl.fromJson;

  @override
  String get url;

  /// Create a copy of CroppedImageVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CroppedImageVersionImplCopyWith<_$CroppedImageVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
