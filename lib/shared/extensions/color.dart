import 'package:flutter/material.dart';

extension HexColor on String {
  Color toColor() {
    // Remove o caractere `#` se existir
    String hex = replaceAll('#', '');

    // Adiciona o valor alfa se não estiver presente
    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    // Converte a String hexadecimal para um inteiro e cria uma cor
    return Color(int.parse(hex, radix: 16));
  }
}
