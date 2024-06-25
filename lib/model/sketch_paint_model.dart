// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  SketchPaintModel copyWith({
    Color? penColor,
    bool? fillStroke,
    double? strokeSize,
    List<Offset>? points,
  }) {
    return SketchPaintModel(
      penColor: penColor ?? this.penColor,
      fillStroke: fillStroke ?? this.fillStroke,
      strokeSize: strokeSize ?? this.strokeSize,
      points: points ?? this.points,
    );
  }
}
