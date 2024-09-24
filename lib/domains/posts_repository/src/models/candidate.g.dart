// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateImpl _$$CandidateImplFromJson(Map<String, dynamic> json) =>
    _$CandidateImpl(
      url: json['url'] as String,
      height: (json['height'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$$CandidateImplToJson(_$CandidateImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'height': instance.height,
      'width': instance.width,
    };
