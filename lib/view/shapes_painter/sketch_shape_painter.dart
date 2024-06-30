import 'package:canvas_paint/model/sketch_paint_type.dart';
import 'package:flutter/material.dart';

class SketchShapePainter extends CustomPainter {
  const SketchShapePainter({required this.color, required this.type});
  final Color color;
  final SketchPaintType type;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final height = size.height;
    final width = size.width;

    final center = Offset(width / 2, height / 2);
    final rect = Rect.fromCenter(
      center: center,
      width: width,
      height: height,
    );

    if (type == SketchPaintType.circle) {
      final radii = width / 2;
      return canvas.drawCircle(center, radii, paint);
    }
    if (type == SketchPaintType.rectangle) {
      return canvas.drawRect(rect, paint);
    }
    if (type == SketchPaintType.roundRectangle) {
      final rRect = RRect.fromRectAndRadius(
        rect,
        Radius.circular(width * 0.2),
      );
      return canvas.drawRRect(rRect, paint);
    }
    if (type == SketchPaintType.triangle) {
      final path = Path()
        ..moveTo(width / 2, 0)
        ..lineTo(width, height)
        ..lineTo(0, height)
        ..close();
      return canvas.drawPath(path, paint);
    }
    if (type == SketchPaintType.line) {
      final p0 = Offset(0, height / 2);
      final p1 = Offset(width, height / 2);
      return canvas.drawLine(p0, p1, paint);
    }
    // default pen
    final path1 = Path()
      ..moveTo(width * 0.5, 0)
      ..lineTo(width, height * 0.4)
      ..lineTo(width, height)
      ..lineTo(width * 0.5, height)
      ..lineTo(0, height * 0.5)
      ..moveTo(5, 5)
      ..lineTo(width * 0.6, height * 0.6);

    final circle = Rect.fromCircle(
      center: Offset(width * 0.15, height * 0.15),
      radius: 2,
    );
    final path2 = Path()..addOval(circle);
    path1.addPath(path2, Offset(width * 0.5, height * 0.5));
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
