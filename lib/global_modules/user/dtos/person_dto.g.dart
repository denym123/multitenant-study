// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonDto _$PersonDtoFromJson(Map<String, dynamic> json) => _PersonDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  cpf: json['cpf'] as String?,
  birthday: json['birthday'] as String?,
  phone: json['phone'] as String?,
  avatarImage: json['avatarImage'] as String?,
);

Map<String, dynamic> _$PersonDtoToJson(_PersonDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'cpf': instance.cpf,
      'birthday': instance.birthday,
      'phone': instance.phone,
      'avatarImage': instance.avatarImage,
    };
