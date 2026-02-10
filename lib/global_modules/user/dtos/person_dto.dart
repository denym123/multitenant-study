import 'package:freezed_annotation/freezed_annotation.dart';

import '../../global_modules.dart';

part 'person_dto.freezed.dart';
part 'person_dto.g.dart';

@freezed
abstract class PersonDto with _$PersonDto {
  const factory PersonDto({
    int? id,
    String? name,
    String? email,
    String? cpf,
    required String? birthday,
    required String? phone,
    String? avatarImage,
  }) = _PersonDto;

  factory PersonDto.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoFromJson(json);
}

// A Extension fica aqui, no final do arquivo
extension PersonDtoMapper on PersonDto {
  Person toEntity() {
    return Person(
      id: id,
      name: name,
      email: email,
      cpf: cpf,
      birthday: birthday,
      phone: phone,
      avatarImage: avatarImage,
    );
  }
}
