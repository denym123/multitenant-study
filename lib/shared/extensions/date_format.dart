import 'package:intl/intl.dart';

extension DateStringExtension on String {
  String formatIsoTo(String outputFormat, {bool utc = false}) {
    DateTime dt = DateTime.parse(this);
    if (utc) dt = dt.toUtc();
    return DateFormat(outputFormat, "pt_BR").format(dt);
  }

  String? formatWith(
    String inputFormat,
    String outputFormat, {
    bool utc = false,
  }) {
    if (isEmpty) return null;
    DateTime dt = DateFormat(inputFormat, 'pt_BR').parse(this);
    return DateFormat(outputFormat, "pt_BR").format(dt);
  }
}

extension DateTimeExtension on DateTime {
  String format(String outputFormat, {bool utc = false}) {
    DateTime dt = this;
    if (utc) dt = dt.toUtc();
    return DateFormat(outputFormat, 'pt_BR').format(dt);
  }

  DateTime combineWithTimeString(String timeString) {
    try {
      // 1. Quebra a string pelo caractere ":"
      final parts = timeString.split(':');

      if (parts.length < 2) {
        throw const FormatException(
          'Formato de hora inválido. Esperado "HH:mm".',
        );
      }

      // 2. Converte as partes para inteiros
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      // Opcional: lida com os segundos se eles existirem
      final second = parts.length > 2 ? int.parse(parts[2]) : 0;

      // 3. Retorna o novo DateTime combinado
      return DateTime(year, month, day, hour, minute, second);
    } on FormatException {
      // Relança a exceção com uma mensagem mais clara
      throw FormatException('A string "$timeString" não é um horário válido.');
    }
  }
}
