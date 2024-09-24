// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoVersionImpl _$$VideoVersionImplFromJson(Map<String, dynamic> json) =>
    _$VideoVersionImpl(
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$VideoVersionImplToJson(_$VideoVersionImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
