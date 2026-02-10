import 'package:freezed_annotation/freezed_annotation.dart';
import '../user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    int? id,
    String? username,
    PersonDto? person,
    List<String>? roles,
    List<String>? permissions,
    bool? hasFiliation,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

extension UserDtoMapper on UserDto {
  User toEntity() {
    return User(
      id: id,
      username: username,
      person: person?.toEntity(),
      roles: roles,
      permissions: permissions,
      hasFiliation: hasFiliation,
    );
  }
}
