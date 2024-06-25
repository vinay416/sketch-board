import 'package:flutter/material.dart';

import '../../model/sketch_paint_model.dart';

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
