// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarouselMedia _$CarouselMediaFromJson(Map<String, dynamic> json) {
  return _CarouselMedia.fromJson(json);
}

/// @nodoc
mixin _$CarouselMedia {
  String get id => throw _privateConstructorUsedError;
  int get mediaType => throw _privateConstructorUsedError;
  int get originalHeight => throw _privateConstructorUsedError;
  int get originalWidth => throw _privateConstructorUsedError;
  List<ImageVersions2> get imageVersions2 => throw _privateConstructorUsedError;
  List<VideoVersion>? get videosVersions => throw _privateConstructorUsedError;

  /// Serializes this CarouselMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarouselMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarouselMediaCopyWith<CarouselMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselMediaCopyWith<$Res> {
  factory $CarouselMediaCopyWith(
          CarouselMedia value, $Res Function(CarouselMedia) then) =
      _$CarouselMediaCopyWithImpl<$Res, CarouselMedia>;
  @useResult
  $Res call(
      {String id,
      int mediaType,
      int originalHeight,
      int originalWidth,
      List<ImageVersions2> imageVersions2,
      List<VideoVersion>? videosVersions});
}

/// @nodoc
class _$CarouselMediaCopyWithImpl<$Res, $Val extends CarouselMedia>
    implements $CarouselMediaCopyWith<$Res> {
  _$CarouselMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarouselMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaType = null,
    Object? originalHeight = null,
    Object? originalWidth = null,
    Object? imageVersions2 = null,
    Object? videosVersions = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as int,
      originalHeight: null == originalHeight
          ? _value.originalHeight
          : originalHeight // ignore: cast_nullable_to_non_nullable
              as int,
      originalWidth: null == originalWidth
          ? _value.originalWidth
          : originalWidth // ignore: cast_nullable_to_non_nullable
              as int,
      imageVersions2: null == imageVersions2
          ? _value.imageVersions2
          : imageVersions2 // ignore: cast_nullable_to_non_nullable
              as List<ImageVersions2>,
      videosVersions: freezed == videosVersions
          ? _value.videosVersions
          : videosVersions // ignore: cast_nullable_to_non_nullable
              as List<VideoVersion>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarouselMediaImplCopyWith<$Res>
    implements $CarouselMediaCopyWith<$Res> {
  factory _$$CarouselMediaImplCopyWith(
          _$CarouselMediaImpl value, $Res Function(_$CarouselMediaImpl) then) =
      __$$CarouselMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int mediaType,
      int originalHeight,
      int originalWidth,
      List<ImageVersions2> imageVersions2,
      List<VideoVersion>? videosVersions});
}

/// @nodoc
class __$$CarouselMediaImplCopyWithImpl<$Res>
    extends _$CarouselMediaCopyWithImpl<$Res, _$CarouselMediaImpl>
    implements _$$CarouselMediaImplCopyWith<$Res> {
  __$$CarouselMediaImplCopyWithImpl(
      _$CarouselMediaImpl _value, $Res Function(_$CarouselMediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarouselMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaType = null,
    Object? originalHeight = null,
    Object? originalWidth = null,
    Object? imageVersions2 = null,
    Object? videosVersions = freezed,
  }) {
    return _then(_$CarouselMediaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as int,
      originalHeight: null == originalHeight
          ? _value.originalHeight
          : originalHeight // ignore: cast_nullable_to_non_nullable
              as int,
      originalWidth: null == originalWidth
          ? _value.originalWidth
          : originalWidth // ignore: cast_nullable_to_non_nullable
              as int,
      imageVersions2: null == imageVersions2
          ? _value._imageVersions2
          : imageVersions2 // ignore: cast_nullable_to_non_nullable
              as List<ImageVersions2>,
      videosVersions: freezed == videosVersions
          ? _value._videosVersions
          : videosVersions // ignore: cast_nullable_to_non_nullable
              as List<VideoVersion>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarouselMediaImpl implements _CarouselMedia {
  const _$CarouselMediaImpl(
      {required this.id,
      required this.mediaType,
      required this.originalHeight,
      required this.originalWidth,
      required final List<ImageVersions2> imageVersions2,
      final List<VideoVersion>? videosVersions})
      : _imageVersions2 = imageVersions2,
        _videosVersions = videosVersions;

  factory _$CarouselMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarouselMediaImplFromJson(json);

  @override
  final String id;
  @override
  final int mediaType;
  @override
  final int originalHeight;
  @override
  final int originalWidth;
  final List<ImageVersions2> _imageVersions2;
  @override
  List<ImageVersions2> get imageVersions2 {
    if (_imageVersions2 is EqualUnmodifiableListView) return _imageVersions2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageVersions2);
  }

  final List<VideoVersion>? _videosVersions;
  @override
  List<VideoVersion>? get videosVersions {
    final value = _videosVersions;
    if (value == null) return null;
    if (_videosVersions is EqualUnmodifiableListView) return _videosVersions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CarouselMedia(id: $id, mediaType: $mediaType, originalHeight: $originalHeight, originalWidth: $originalWidth, imageVersions2: $imageVersions2, videosVersions: $videosVersions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarouselMediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.originalHeight, originalHeight) ||
                other.originalHeight == originalHeight) &&
            (identical(other.originalWidth, originalWidth) ||
                other.originalWidth == originalWidth) &&
            const DeepCollectionEquality()
                .equals(other._imageVersions2, _imageVersions2) &&
            const DeepCollectionEquality()
                .equals(other._videosVersions, _videosVersions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      mediaType,
      originalHeight,
      originalWidth,
      const DeepCollectionEquality().hash(_imageVersions2),
      const DeepCollectionEquality().hash(_videosVersions));

  /// Create a copy of CarouselMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarouselMediaImplCopyWith<_$CarouselMediaImpl> get copyWith =>
      __$$CarouselMediaImplCopyWithImpl<_$CarouselMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarouselMediaImplToJson(
      this,
    );
  }
}

abstract class _CarouselMedia implements CarouselMedia {
  const factory _CarouselMedia(
      {required final String id,
      required final int mediaType,
      required final int originalHeight,
      required final int originalWidth,
      required final List<ImageVersions2> imageVersions2,
      final List<VideoVersion>? videosVersions}) = _$CarouselMediaImpl;

  factory _CarouselMedia.fromJson(Map<String, dynamic> json) =
      _$CarouselMediaImpl.fromJson;

  @override
  String get id;
  @override
  int get mediaType;
  @override
  int get originalHeight;
  @override
  int get originalWidth;
  @override
  List<ImageVersions2> get imageVersions2;
  @override
  List<VideoVersion>? get videosVersions;

  /// Create a copy of CarouselMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarouselMediaImplCopyWith<_$CarouselMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
