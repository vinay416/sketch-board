import 'package:flutter/material.dart';

class SketchDefault {
  static const Color penColor = Colors.black;
  static const PaintingStyle stroke = PaintingStyle.stroke;
  static const double strokeSize = 4.0;
  static List<double> strokes = List.generate(10, (index) => index.toDouble());
}
