// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Person _$PersonFromJson(Map<String, dynamic> json) => _Person(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  cpf: json['cpf'] as String?,
  birthday: json['birthday'] as String?,
  phone: json['phone'] as String?,
  avatarImage: json['avatarImage'] as String?,
);

Map<String, dynamic> _$PersonToJson(_Person instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'cpf': instance.cpf,
  'birthday': instance.birthday,
  'phone': instance.phone,
  'avatarImage': instance.avatarImage,
};
