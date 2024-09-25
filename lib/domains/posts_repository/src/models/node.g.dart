// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeImpl _$$NodeImplFromJson(Map<String, dynamic> json) => _$NodeImpl(
      id: json['id'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String?,
      code: json['code'] as String?,
      mediaType: (json['media_type'] as num?)?.toInt(),
      originalHeight: (json['original_height'] as num).toInt(),
      originalWidth: (json['original_width'] as num).toInt(),
      imageVersions2: json['image_versions2'] == null
          ? null
          : ImageVersions2.fromJson(
              json['image_versions2'] as Map<String, dynamic>),
      carouselMedia: (json['carousel_media'] as List<dynamic>?)
          ?.map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverMedia: json['cover_media'] == null
          ? null
          : CoverMedia.fromJson(json['cover_media'] as Map<String, dynamic>),
      videosVersions: (json['video_versions'] as List<dynamic>?)
          ?.map((e) => VideoVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NodeImplToJson(_$NodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'title': instance.title,
      'code': instance.code,
      'media_type': instance.mediaType,
      'original_height': instance.originalHeight,
      'original_width': instance.originalWidth,
      'image_versions2': instance.imageVersions2,
      'carousel_media': instance.carouselMedia,
      'cover_media': instance.coverMedia,
      'video_versions': instance.videosVersions,
    };
