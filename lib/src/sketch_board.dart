import 'package:canvas_paint/src/sketch_gestures.dart';
import 'package:flutter/material.dart';
import '../model/sketch_paint_model.dart';

class SketchBoard extends StatelessWidget {
  const SketchBoard({
    super.key,
    this.boardColor = Colors.white,
    this.penColor = Colors.black,
    this.stroke = PaintingStyle.stroke,
    this.strokeSize = 4.0,
  });
  final Color boardColor;
  final Color penColor;
  final PaintingStyle stroke;
  final double strokeSize;

  @override
  Widget build(BuildContext context) {
    return SketchGesture(
      paintModel: SketchPaintModel.empty(
        penColor: penColor,
        stroke: stroke,
        strokeSize: strokeSize,
      ),
    );
  }
}




