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
  String? get code => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  @JsonKey(name: "image_versions2")
  ImageVersions2 get imageVersions2 => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "carousel_media")
  List<CarouselMedia>? get carouselMedia => throw _privateConstructorUsedError;

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
      String? code,
      User user,
      @JsonKey(name: "image_versions2") ImageVersions2 imageVersions2,
      String? title,
      String? image,
      @JsonKey(name: "carousel_media") List<CarouselMedia>? carouselMedia});

  $UserCopyWith<$Res> get user;
  $ImageVersions2CopyWith<$Res> get imageVersions2;
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
    Object? code = freezed,
    Object? user = null,
    Object? imageVersions2 = null,
    Object? title = freezed,
    Object? image = freezed,
    Object? carouselMedia = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      imageVersions2: null == imageVersions2
          ? _value.imageVersions2
          : imageVersions2 // ignore: cast_nullable_to_non_nullable
              as ImageVersions2,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      carouselMedia: freezed == carouselMedia
          ? _value.carouselMedia
          : carouselMedia // ignore: cast_nullable_to_non_nullable
              as List<CarouselMedia>?,
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
  $ImageVersions2CopyWith<$Res> get imageVersions2 {
    return $ImageVersions2CopyWith<$Res>(_value.imageVersions2, (value) {
      return _then(_value.copyWith(imageVersions2: value) as $Val);
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
      String? code,
      User user,
      @JsonKey(name: "image_versions2") ImageVersions2 imageVersions2,
      String? title,
      String? image,
      @JsonKey(name: "carousel_media") List<CarouselMedia>? carouselMedia});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $ImageVersions2CopyWith<$Res> get imageVersions2;
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
    Object? code = freezed,
    Object? user = null,
    Object? imageVersions2 = null,
    Object? title = freezed,
    Object? image = freezed,
    Object? carouselMedia = freezed,
  }) {
    return _then(_$NodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      imageVersions2: null == imageVersions2
          ? _value.imageVersions2
          : imageVersions2 // ignore: cast_nullable_to_non_nullable
              as ImageVersions2,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      carouselMedia: freezed == carouselMedia
          ? _value._carouselMedia
          : carouselMedia // ignore: cast_nullable_to_non_nullable
              as List<CarouselMedia>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NodeImpl implements _Node {
  const _$NodeImpl(
      {required this.id,
      this.code,
      required this.user,
      @JsonKey(name: "image_versions2") required this.imageVersions2,
      this.title,
      this.image,
      @JsonKey(name: "carousel_media")
      final List<CarouselMedia>? carouselMedia})
      : _carouselMedia = carouselMedia;

  factory _$NodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NodeImplFromJson(json);

  @override
  final String id;
  @override
  final String? code;
  @override
  final User user;
  @override
  @JsonKey(name: "image_versions2")
  final ImageVersions2 imageVersions2;
  @override
  final String? title;
  @override
  final String? image;
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
  String toString() {
    return 'Node(id: $id, code: $code, user: $user, imageVersions2: $imageVersions2, title: $title, image: $image, carouselMedia: $carouselMedia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.imageVersions2, imageVersions2) ||
                other.imageVersions2 == imageVersions2) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._carouselMedia, _carouselMedia));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, user, imageVersions2,
      title, image, const DeepCollectionEquality().hash(_carouselMedia));

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
      final String? code,
      required final User user,
      @JsonKey(name: "image_versions2")
      required final ImageVersions2 imageVersions2,
      final String? title,
      final String? image,
      @JsonKey(name: "carousel_media")
      final List<CarouselMedia>? carouselMedia}) = _$NodeImpl;

  factory _Node.fromJson(Map<String, dynamic> json) = _$NodeImpl.fromJson;

  @override
  String get id;
  @override
  String? get code;
  @override
  User get user;
  @override
  @JsonKey(name: "image_versions2")
  ImageVersions2 get imageVersions2;
  @override
  String? get title;
  @override
  String? get image;
  @override
  @JsonKey(name: "carousel_media")
  List<CarouselMedia>? get carouselMedia;

  /// Create a copy of Node
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NodeImplCopyWith<_$NodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
