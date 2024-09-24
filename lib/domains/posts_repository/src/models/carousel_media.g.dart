// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarouselMediaImpl _$$CarouselMediaImplFromJson(Map<String, dynamic> json) =>
    _$CarouselMediaImpl(
      id: json['id'] as String,
      mediaType: (json['mediaType'] as num).toInt(),
      originalHeight: (json['originalHeight'] as num).toInt(),
      originalWidth: (json['originalWidth'] as num).toInt(),
      imageVersions2: (json['imageVersions2'] as List<dynamic>)
          .map((e) => ImageVersions2.fromJson(e as Map<String, dynamic>))
          .toList(),
      videosVersions: (json['videosVersions'] as List<dynamic>?)
          ?.map((e) => VideoVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CarouselMediaImplToJson(_$CarouselMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaType': instance.mediaType,
      'originalHeight': instance.originalHeight,
      'originalWidth': instance.originalWidth,
      'imageVersions2': instance.imageVersions2,
      'videosVersions': instance.videosVersions,
    };
