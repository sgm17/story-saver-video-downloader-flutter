// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeImpl _$$NodeImplFromJson(Map<String, dynamic> json) => _$NodeImpl(
      id: json['id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      code: json['code'] as String?,
      imageVersions2: json['image_versions2'] == null
          ? null
          : ImageVersions2.fromJson(
              json['image_versions2'] as Map<String, dynamic>),
      title: json['title'] as String?,
      carouselMedia: (json['carousel_media'] as List<dynamic>?)
          ?.map((e) => CarouselMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverMedia: json['cover_media'] == null
          ? null
          : CoverMedia.fromJson(json['cover_media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NodeImplToJson(_$NodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'code': instance.code,
      'image_versions2': instance.imageVersions2,
      'title': instance.title,
      'carousel_media': instance.carouselMedia,
      'cover_media': instance.coverMedia,
    };
