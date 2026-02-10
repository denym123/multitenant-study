/// Extensão para adicionar funcionalidades de validação de CPF a Strings.
extension CpfValidatorExtension on String? {
  /// Valida se a String é um número de CPF válido.
  ///
  /// Retorna `true` se o CPF for válido, `false` caso contrário.
  /// A validação já lida com strings formatadas (com pontos e traço) ou nulas.
  bool get isValidCpf {
    // 1. Pega a string atual e verifica se é nula ou vazia.
    final String? cpf = this;
    if (cpf == null || cpf.isEmpty) return false;

    // 2. Remove todos os caracteres que não são dígitos.
    // Ex: "123.456.789-00" -> "12345678900"
    final String cleanedCpf = cpf.replaceAll(RegExp(r'[^\d]'), '');

    // 3. Verifica se o CPF tem 11 dígitos.
    if (cleanedCpf.length != 11) return false;

    // 4. Verifica se todos os dígitos são iguais (ex: "111.111.111-11").
    // Estes são considerados CPFs inválidos, apesar de passarem no cálculo.
    if (Set.from(cleanedCpf.split('')).length == 1) return false;

    // 5. Algoritmo de cálculo dos dígitos verificadores.
    try {
      // --- Cálculo do primeiro dígito verificador ---
      int sum = 0;
      for (int i = 0; i < 9; i++) {
        sum += int.parse(cleanedCpf[i]) * (10 - i);
      }
      int remainder = sum % 11;
      int firstDigit = (remainder < 2) ? 0 : 11 - remainder;

      // Compara o dígito calculado com o dígito real (10º dígito do CPF)
      if (firstDigit != int.parse(cleanedCpf[9])) {
        return false;
      }

      // --- Cálculo do segundo dígito verificador ---
      sum = 0;
      for (int i = 0; i < 10; i++) {
        sum += int.parse(cleanedCpf[i]) * (11 - i);
      }
      remainder = sum % 11;
      int secondDigit = (remainder < 2) ? 0 : 11 - remainder;

      // Compara o dígito calculado com o dígito real (11º dígito do CPF)
      if (secondDigit != int.parse(cleanedCpf[10])) {
        return false;
      }

      // 6. Se todas as verificações passaram, o CPF é válido.
      return true;
    } catch (e) {
      // Caso ocorra algum erro na conversão para inteiro, o CPF é inválido.
      return false;
    }
  }
}
