import 'package:flutter/material.dart';
import 'sketch_paint_types.dart';

class SketchPaintModel {
  const SketchPaintModel({
    required this.penColor,
    required this.stroke,
    required this.strokeSize,
    required this.points,
    required this.type,
  });
  final Color penColor;
  final PaintingStyle stroke;
  final double strokeSize;
  final List<Offset> points;
  final SketchPaintType type;

  factory SketchPaintModel.empty({
    required Color penColor,
    required PaintingStyle stroke,
    required double strokeSize,
  }) {
    return SketchPaintModel(
      type: SketchPaintType.pen,
      penColor: penColor,
      stroke: stroke,
      strokeSize: strokeSize,
      points: [],
    );
  }

  SketchPaintModel copyWith({
    Color? penColor,
    PaintingStyle? stroke,
    double? strokeSize,
    List<Offset>? points,
    SketchPaintType? type
  }) {
    return SketchPaintModel(
      type: type ?? this.type,
      penColor: penColor ?? this.penColor,
      stroke: stroke ?? this.stroke,
      strokeSize: strokeSize ?? this.strokeSize,
      points: points ?? this.points,
    );
  }
}
