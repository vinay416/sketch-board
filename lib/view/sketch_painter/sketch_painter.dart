import 'package:flutter/material.dart';

import '../../model/sketch_paint_model.dart';
import '../../model/sketch_paint_type.dart';

class SketchPainter extends CustomPainter {
  const SketchPainter({required this.sketchModel});
  final SketchPaintModel sketchModel;

  @override
  void paint(Canvas canvas, Size size) {
    if (sketchModel.points.isEmpty) return;

    final paint = Paint()
      ..color = sketchModel.penColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = sketchModel.strokeSize
      ..style = sketchModel.stroke;

    final path = Path();
    final p0 = sketchModel.points.first;
    final p1 = sketchModel.points.last;

    if (sketchModel.type == SketchPaintType.line) {
      return canvas.drawLine(p0, p1, paint);
    }
    if (sketchModel.type == SketchPaintType.rectangle) {
      return canvas.drawRect(Rect.fromPoints(p0, p1), paint);
    }
    if (sketchModel.type == SketchPaintType.roundRectangle) {
      final radii = ((p0.dy + p1.dx) * 0.05);
      final rect = RRect.fromRectAndRadius(
        Rect.fromPoints(p0, p1),
        Radius.circular(radii),
      );
      return canvas.drawRRect(rect, paint);
    }
    if (sketchModel.type == SketchPaintType.circle) {
      final wRadii = ((p0.dx + p1.dx) / 2);
      final hRadii = ((p0.dy + p1.dy) / 2);
      final radii = wRadii > hRadii ? wRadii : hRadii;

      final rect = RRect.fromRectAndRadius(
        Rect.fromPoints(p0, p1),
        Radius.circular(radii),
      );

      return canvas.drawRRect(
        rect,
        paint,
      );
    }

    //* Free flow
    //move the point to 1st offset
    path.moveTo(p0.dx, p0.dy);
    //add the moving getsure points
    for (var i = 1; i < sketchModel.points.length - 1; i++) {
      final p1 = sketchModel.points[i];
      final p2 = sketchModel.points[i + 1];

      final c1 = (p1.dx + p2.dx) / 2;
      final c2 = (p1.dy + p2.dy) / 2;
      path.quadraticBezierTo(c1, c2, p2.dx, p2.dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
