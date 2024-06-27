import 'package:flutter/material.dart';

class StrokeBrushIcon extends CustomPainter {
  StrokeBrushIcon({required this.strokeSize});
  final double strokeSize;

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeSize;

    final path = Path();
    path.moveTo(0, height / 2);
    final c1 = Offset(width * 0.25, 0);
    final c2 = Offset(width * 0.65, height);
    final p2 = Offset(width, height / 2);
    path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p2.dx, p2.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
