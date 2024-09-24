// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarouselMediaImpl _$$CarouselMediaImplFromJson(Map<String, dynamic> json) =>
    _$CarouselMediaImpl(
      id: json['id'] as String,
      mediaType: (json['media_type'] as num).toInt(),
      originalHeight: (json['original_height'] as num).toInt(),
      originalWidth: (json['original_width'] as num).toInt(),
      imageVersions2: ImageVersions2.fromJson(
          json['image_versions2'] as Map<String, dynamic>),
      videosVersions: (json['video_versions'] as List<dynamic>?)
          ?.map((e) => VideoVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CarouselMediaImplToJson(_$CarouselMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media_type': instance.mediaType,
      'original_height': instance.originalHeight,
      'original_width': instance.originalWidth,
      'image_versions2': instance.imageVersions2,
      'video_versions': instance.videosVersions,
    };
