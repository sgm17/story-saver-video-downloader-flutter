// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HighlightImpl _$$HighlightImplFromJson(Map<String, dynamic> json) =>
    _$HighlightImpl(
      username: json['username'] as String,
      edges: (json['edges'] as List<dynamic>)
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HighlightImplToJson(_$HighlightImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'edges': instance.edges,
    };
