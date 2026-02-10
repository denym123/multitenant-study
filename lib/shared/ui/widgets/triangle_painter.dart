import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final double borderRadius;
  final Color color;

  TrianglePainter({
    this.borderRadius = 10.0,
    this.color = Colors.grey,
  }); // Valor padrão para o raio

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Início no canto superior esquerdo
    path.moveTo(0, 0);

    // Linha até um ponto ANTES do canto superior direito, considerando o raio
    path.lineTo(size.width - borderRadius, 0);

    // Adiciona o arco para arredondar o canto superior direito
    path.arcToPoint(
      Offset(size.width, borderRadius), // Ponto final do arco
      radius: Radius.circular(borderRadius), // Raio do arredondamento
      clockwise: true, // Desenha o arco no sentido horário
    );

    // Linha do final do arco até o canto inferior direito
    path.lineTo(size.width, size.height);

    // Fecha o caminho de volta ao ponto inicial (canto superior esquerdo)
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant TrianglePainter oldDelegate) {
    // Redesenha se o raio da borda mudar
    return oldDelegate.borderRadius != borderRadius;
  }
}
