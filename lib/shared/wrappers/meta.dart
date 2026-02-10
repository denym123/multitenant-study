import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
abstract class Meta with _$Meta {
  // A anotação @JsonSerializable aqui converte 'last_page' para 'lastPage', etc.
  factory Meta({
    required int? total,
    required int? to,
    required int? currentPage,
    required int? lastPage,
  }) = _Meta;

  // Delega a conversão de JSON para o código gerado.
  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
