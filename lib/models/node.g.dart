// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeImpl _$$NodeImplFromJson(Map<String, dynamic> json) => _$NodeImpl(
      id: json['id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      imageVersions2: (json['imageVersions2'] as List<dynamic>)
          .map((e) => ImageVersions2.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      carouselMedia: (json['carouselMedia'] as List<dynamic>?)
          ?.map((e) => CarouselMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NodeImplToJson(_$NodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'imageVersions2': instance.imageVersions2,
      'title': instance.title,
      'image': instance.image,
      'carouselMedia': instance.carouselMedia,
    };
