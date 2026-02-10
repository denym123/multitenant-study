// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String?,
  person: json['person'] == null
      ? null
      : PersonDto.fromJson(json['person'] as Map<String, dynamic>),
  roles: (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
  permissions: (json['permissions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  hasFiliation: json['hasFiliation'] as bool?,
);

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'person': instance.person,
  'roles': instance.roles,
  'permissions': instance.permissions,
  'hasFiliation': instance.hasFiliation,
};
