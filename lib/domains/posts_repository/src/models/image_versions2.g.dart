// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_versions2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageVersions2Impl _$$ImageVersions2ImplFromJson(Map<String, dynamic> json) =>
    _$ImageVersions2Impl(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImageVersions2ImplToJson(
        _$ImageVersions2Impl instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };
