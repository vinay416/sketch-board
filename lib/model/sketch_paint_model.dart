// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SketchPaintModel {
  const SketchPaintModel({
    required this.penColor,
    required this.stroke,
    required this.strokeSize,
    required this.points,
  });
  final Color penColor;
  final PaintingStyle stroke;
  final double strokeSize;
  final List<Offset> points;

  factory SketchPaintModel.empty({
    required Color penColor,
    required PaintingStyle stroke,
    required double strokeSize,
  }) {
    return SketchPaintModel(
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
  }) {
    return SketchPaintModel(
      penColor: penColor ?? this.penColor,
      stroke: stroke ?? this.stroke,
      strokeSize: strokeSize ?? this.strokeSize,
      points: points ?? this.points,
    );
  }
}
