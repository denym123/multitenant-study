import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
abstract class Person with _$Person {
  factory Person({
    int? id,
    String? name,
    String? email,
    String? cpf,
    required String? birthday,
    required String? phone,
    String? avatarImage,
  }) = _Person;
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
