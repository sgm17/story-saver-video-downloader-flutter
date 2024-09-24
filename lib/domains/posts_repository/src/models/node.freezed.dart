// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Node _$NodeFromJson(Map<String, dynamic> json) {
  return _Node.fromJson(json);
}

/// @nodoc
mixin _$Node {
  String get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "image_versions2")
  ImageVersions2? get imageVersions2 => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "carousel_media")
  List<CarouselMedia>? get carouselMedia => throw _privateConstructorUsedError;
  @JsonKey(name: "cover_media")
  CoverMedia? get coverMedia => throw _privateConstructorUsedError;

  /// Serializes this Node to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Node
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NodeCopyWith<Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeCopyWith<$Res> {
  factory $NodeCopyWith(Node value, $Res Function(Node) then) =
      _$NodeCopyWithImpl<$Res, Node>;
  @useResult
  $Res call(
      {String id,
      User user,
      String? code,
      @JsonKey(name: "image_versions2") ImageVersions2? imageVersions2,
      String? title,
      @JsonKey(name: "carousel_media") List<CarouselMedia>? carouselMedia,
      @JsonKey(name: "cover_media") CoverMedia? coverMedia});

  $UserCopyWith<$Res> get user;
  $ImageVersions2CopyWith<$Res>? get imageVersions2;
  $CoverMediaCopyWith<$Res>? get coverMedia;
}

/// @nodoc
class _$NodeCopyWithImpl<$Res, $Val extends Node>
    implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Node
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? code = freezed,
    Object? imageVersions2 = freezed,
    Object? title = freezed,
    Object? carouselMedia = freezed,
    Object? coverMedia = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      imageVersions2: freezed == imageVersions2
          ? _value.imageVersions2
          : imageVersions2 // ignore: cast_nullable_to_non_nullable
              as ImageVersions2?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      carouselMedia: freezed == carouselMedia
          ? _value.carouselMedia
          : carouselMedia // ignore: cast_nullable_to_non_nullable
              as List<CarouselMedia>?,
      coverMedia: freezed == coverMedia
          ? _value.coverMedia
          : coverMedia // ignore: cast_nullable_to_non_nullable
              as CoverMedia?,
    ) as $Val);
  }

  /// Create a copy of Node
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of Node
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageVersions2CopyWith<$Res>? get imageVersions2 {
    if (_value.imageVersions2 == null) {
      return null;
    }

    return $ImageVersions2CopyWith<$Res>(_value.imageVersions2!, (value) {
      return _then(_value.copyWith(imageVersions2: value) as $Val);
    });
  }

  /// Create a copy of Node
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoverMediaCopyWith<$Res>? get coverMedia {
    if (_value.coverMedia == null) {
      return null;
    }

    return $CoverMediaCopyWith<$Res>(_value.coverMedia!, (value) {
      return _then(_value.copyWith(coverMedia: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NodeImplCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$NodeImplCopyWith(
          _$NodeImpl value, $Res Function(_$NodeImpl) then) =
      __$$NodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      User user,
      String? code,
      @JsonKey(name: "image_versions2") ImageVersions2? imageVersions2,
      String? title,
      @JsonKey(name: "carousel_media") List<CarouselMedia>? carouselMedia,
      @JsonKey(name: "cover_media") CoverMedia? coverMedia});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $ImageVersions2CopyWith<$Res>? get imageVersions2;
  @override
  $CoverMediaCopyWith<$Res>? get coverMedia;
}

/// @nodoc
class __$$NodeImplCopyWithImpl<$Res>
    extends _$NodeCopyWithImpl<$Res, _$NodeImpl>
    implements _$$NodeImplCopyWith<$Res> {
  __$$NodeImplCopyWithImpl(_$NodeImpl _value, $Res Function(_$NodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Node
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? code = freezed,
    Object? imageVersions2 = freezed,
    Object? title = freezed,
    Object? carouselMedia = freezed,
    Object? coverMedia = freezed,
  }) {
    return _then(_$NodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      imageVersions2: freezed == imageVersions2
          ? _value.imageVersions2
          : imageVersions2 // ignore: cast_nullable_to_non_nullable
              as ImageVersions2?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      carouselMedia: freezed == carouselMedia
          ? _value._carouselMedia
          : carouselMedia // ignore: cast_nullable_to_non_nullable
              as List<CarouselMedia>?,
      coverMedia: freezed == coverMedia
          ? _value.coverMedia
          : coverMedia // ignore: cast_nullable_to_non_nullable
              as CoverMedia?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NodeImpl implements _Node {
  const _$NodeImpl(
      {required this.id,
      required this.user,
      this.code,
      @JsonKey(name: "image_versions2") this.imageVersions2,
      this.title,
      @JsonKey(name: "carousel_media") final List<CarouselMedia>? carouselMedia,
      @JsonKey(name: "cover_media") this.coverMedia})
      : _carouselMedia = carouselMedia;

  factory _$NodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NodeImplFromJson(json);

  @override
  final String id;
  @override
  final User user;
  @override
  final String? code;
  @override
  @JsonKey(name: "image_versions2")
  final ImageVersions2? imageVersions2;
  @override
  final String? title;
  final List<CarouselMedia>? _carouselMedia;
  @override
  @JsonKey(name: "carousel_media")
  List<CarouselMedia>? get carouselMedia {
    final value = _carouselMedia;
    if (value == null) return null;
    if (_carouselMedia is EqualUnmodifiableListView) return _carouselMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "cover_media")
  final CoverMedia? coverMedia;

  @override
  String toString() {
    return 'Node(id: $id, user: $user, code: $code, imageVersions2: $imageVersions2, title: $title, carouselMedia: $carouselMedia, coverMedia: $coverMedia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.imageVersions2, imageVersions2) ||
                other.imageVersions2 == imageVersions2) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._carouselMedia, _carouselMedia) &&
            (identical(other.coverMedia, coverMedia) ||
                other.coverMedia == coverMedia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, code, imageVersions2,
      title, const DeepCollectionEquality().hash(_carouselMedia), coverMedia);

  /// Create a copy of Node
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NodeImplCopyWith<_$NodeImpl> get copyWith =>
      __$$NodeImplCopyWithImpl<_$NodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NodeImplToJson(
      this,
    );
  }
}

abstract class _Node implements Node {
  const factory _Node(
      {required final String id,
      required final User user,
      final String? code,
      @JsonKey(name: "image_versions2") final ImageVersions2? imageVersions2,
      final String? title,
      @JsonKey(name: "carousel_media") final List<CarouselMedia>? carouselMedia,
      @JsonKey(name: "cover_media") final CoverMedia? coverMedia}) = _$NodeImpl;

  factory _Node.fromJson(Map<String, dynamic> json) = _$NodeImpl.fromJson;

  @override
  String get id;
  @override
  User get user;
  @override
  String? get code;
  @override
  @JsonKey(name: "image_versions2")
  ImageVersions2? get imageVersions2;
  @override
  String? get title;
  @override
  @JsonKey(name: "carousel_media")
  List<CarouselMedia>? get carouselMedia;
  @override
  @JsonKey(name: "cover_media")
  CoverMedia? get coverMedia;

  /// Create a copy of Node
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NodeImplCopyWith<_$NodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
