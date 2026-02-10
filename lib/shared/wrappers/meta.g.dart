// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Meta _$MetaFromJson(Map<String, dynamic> json) => _Meta(
  total: (json['total'] as num?)?.toInt(),
  to: (json['to'] as num?)?.toInt(),
  currentPage: (json['currentPage'] as num?)?.toInt(),
  lastPage: (json['lastPage'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
  'total': instance.total,
  'to': instance.to,
  'currentPage': instance.currentPage,
  'lastPage': instance.lastPage,
};
