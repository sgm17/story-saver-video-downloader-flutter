// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cover_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoverMedia _$CoverMediaFromJson(Map<String, dynamic> json) {
  return _CoverMedia.fromJson(json);
}

/// @nodoc
mixin _$CoverMedia {
  @JsonKey(name: "cropped_image_version")
  CroppedImageVersion get croppedImageVersion =>
      throw _privateConstructorUsedError;

  /// Serializes this CoverMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoverMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoverMediaCopyWith<CoverMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoverMediaCopyWith<$Res> {
  factory $CoverMediaCopyWith(
          CoverMedia value, $Res Function(CoverMedia) then) =
      _$CoverMediaCopyWithImpl<$Res, CoverMedia>;
  @useResult
  $Res call(
      {@JsonKey(name: "cropped_image_version")
      CroppedImageVersion croppedImageVersion});

  $CroppedImageVersionCopyWith<$Res> get croppedImageVersion;
}

/// @nodoc
class _$CoverMediaCopyWithImpl<$Res, $Val extends CoverMedia>
    implements $CoverMediaCopyWith<$Res> {
  _$CoverMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoverMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? croppedImageVersion = null,
  }) {
    return _then(_value.copyWith(
      croppedImageVersion: null == croppedImageVersion
          ? _value.croppedImageVersion
          : croppedImageVersion // ignore: cast_nullable_to_non_nullable
              as CroppedImageVersion,
    ) as $Val);
  }

  /// Create a copy of CoverMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CroppedImageVersionCopyWith<$Res> get croppedImageVersion {
    return $CroppedImageVersionCopyWith<$Res>(_value.croppedImageVersion,
        (value) {
      return _then(_value.copyWith(croppedImageVersion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoverMediaImplCopyWith<$Res>
    implements $CoverMediaCopyWith<$Res> {
  factory _$$CoverMediaImplCopyWith(
          _$CoverMediaImpl value, $Res Function(_$CoverMediaImpl) then) =
      __$$CoverMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "cropped_image_version")
      CroppedImageVersion croppedImageVersion});

  @override
  $CroppedImageVersionCopyWith<$Res> get croppedImageVersion;
}

/// @nodoc
class __$$CoverMediaImplCopyWithImpl<$Res>
    extends _$CoverMediaCopyWithImpl<$Res, _$CoverMediaImpl>
    implements _$$CoverMediaImplCopyWith<$Res> {
  __$$CoverMediaImplCopyWithImpl(
      _$CoverMediaImpl _value, $Res Function(_$CoverMediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoverMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? croppedImageVersion = null,
  }) {
    return _then(_$CoverMediaImpl(
      croppedImageVersion: null == croppedImageVersion
          ? _value.croppedImageVersion
          : croppedImageVersion // ignore: cast_nullable_to_non_nullable
              as CroppedImageVersion,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoverMediaImpl implements _CoverMedia {
  const _$CoverMediaImpl(
      {@JsonKey(name: "cropped_image_version")
      required this.croppedImageVersion});

  factory _$CoverMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoverMediaImplFromJson(json);

  @override
  @JsonKey(name: "cropped_image_version")
  final CroppedImageVersion croppedImageVersion;

  @override
  String toString() {
    return 'CoverMedia(croppedImageVersion: $croppedImageVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoverMediaImpl &&
            (identical(other.croppedImageVersion, croppedImageVersion) ||
                other.croppedImageVersion == croppedImageVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, croppedImageVersion);

  /// Create a copy of CoverMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoverMediaImplCopyWith<_$CoverMediaImpl> get copyWith =>
      __$$CoverMediaImplCopyWithImpl<_$CoverMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoverMediaImplToJson(
      this,
    );
  }
}

abstract class _CoverMedia implements CoverMedia {
  const factory _CoverMedia(
          {@JsonKey(name: "cropped_image_version")
          required final CroppedImageVersion croppedImageVersion}) =
      _$CoverMediaImpl;

  factory _CoverMedia.fromJson(Map<String, dynamic> json) =
      _$CoverMediaImpl.fromJson;

  @override
  @JsonKey(name: "cropped_image_version")
  CroppedImageVersion get croppedImageVersion;

  /// Create a copy of CoverMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoverMediaImplCopyWith<_$CoverMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
