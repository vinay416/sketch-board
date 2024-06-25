import 'package:flutter/material.dart';

class SketchPaintModel {
  const SketchPaintModel({
    required this.penColor,
    required this.fillStroke,
    required this.strokeSize,
    required this.points,
  });
  final Color penColor;
  final bool fillStroke;
  final double strokeSize;
  final List<Offset> points;
}
