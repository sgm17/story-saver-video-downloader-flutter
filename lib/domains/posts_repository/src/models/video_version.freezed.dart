// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoVersion _$VideoVersionFromJson(Map<String, dynamic> json) {
  return _VideoVersion.fromJson(json);
}

/// @nodoc
mixin _$VideoVersion {
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this VideoVersion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoVersionCopyWith<VideoVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoVersionCopyWith<$Res> {
  factory $VideoVersionCopyWith(
          VideoVersion value, $Res Function(VideoVersion) then) =
      _$VideoVersionCopyWithImpl<$Res, VideoVersion>;
  @useResult
  $Res call({int? width, int? height, String url});
}

/// @nodoc
class _$VideoVersionCopyWithImpl<$Res, $Val extends VideoVersion>
    implements $VideoVersionCopyWith<$Res> {
  _$VideoVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoVersionImplCopyWith<$Res>
    implements $VideoVersionCopyWith<$Res> {
  factory _$$VideoVersionImplCopyWith(
          _$VideoVersionImpl value, $Res Function(_$VideoVersionImpl) then) =
      __$$VideoVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? width, int? height, String url});
}

/// @nodoc
class __$$VideoVersionImplCopyWithImpl<$Res>
    extends _$VideoVersionCopyWithImpl<$Res, _$VideoVersionImpl>
    implements _$$VideoVersionImplCopyWith<$Res> {
  __$$VideoVersionImplCopyWithImpl(
      _$VideoVersionImpl _value, $Res Function(_$VideoVersionImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? url = null,
  }) {
    return _then(_$VideoVersionImpl(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoVersionImpl implements _VideoVersion {
  const _$VideoVersionImpl({this.width, this.height, required this.url});

  factory _$VideoVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoVersionImplFromJson(json);

  @override
  final int? width;
  @override
  final int? height;
  @override
  final String url;

  @override
  String toString() {
    return 'VideoVersion(width: $width, height: $height, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoVersionImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, url);

  /// Create a copy of VideoVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoVersionImplCopyWith<_$VideoVersionImpl> get copyWith =>
      __$$VideoVersionImplCopyWithImpl<_$VideoVersionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoVersionImplToJson(
      this,
    );
  }
}

abstract class _VideoVersion implements VideoVersion {
  const factory _VideoVersion(
      {final int? width,
      final int? height,
      required final String url}) = _$VideoVersionImpl;

  factory _VideoVersion.fromJson(Map<String, dynamic> json) =
      _$VideoVersionImpl.fromJson;

  @override
  int? get width;
  @override
  int? get height;
  @override
  String get url;

  /// Create a copy of VideoVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoVersionImplCopyWith<_$VideoVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
