// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeImpl _$$NodeImplFromJson(Map<String, dynamic> json) => _$NodeImpl(
      id: json['id'] as String,
      code: json['code'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      imageVersions2: ImageVersions2.fromJson(
          json['image_versions2'] as Map<String, dynamic>),
      title: json['title'] as String?,
      image: json['image'] as String?,
      carouselMedia: (json['carousel_media'] as List<dynamic>?)
          ?.map((e) => CarouselMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NodeImplToJson(_$NodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'user': instance.user,
      'image_versions2': instance.imageVersions2,
      'title': instance.title,
      'image': instance.image,
      'carousel_media': instance.carouselMedia,
    };
