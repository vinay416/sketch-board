import 'package:canvas_paint/model/sketch_paint_model.dart';
import 'package:flutter/material.dart';

import '../utils/sketch_default.dart';

class SketchViewModel with ChangeNotifier {
  List<SketchPaintModel> _sketchs = [];
  List<SketchPaintModel> get sketchs => List.unmodifiable(_sketchs);

  SketchPaintModel get defaultSketch {
    return SketchPaintModel.empty(
      penColor: SketchDefault.penColor,
      stroke: SketchDefault.stroke,
      strokeSize: SketchDefault.strokeSize,
    );
  }

  void addNewSketch(SketchPaintModel sketch, {bool notify = true}) {
    _sketchs = [..._sketchs, sketch];
    if (notify) notifyListeners();
  }

  void clearSketch() {
    _sketchs = [];
    notifyListeners();
  }

  void updatePainter() => notifyListeners();

  // Current tools value
  Color get currentPenColor {
    if (_sketchs.isEmpty) return defaultSketch.penColor;
    return _sketchs.last.penColor;
  }

  void updateSketchColor(Color penColor) {
    final newSketch = _sketchs.last.copyWith(penColor: penColor, points: []);
    addNewSketch(newSketch);
  }

  double get currentStrokeSize {
    if (_sketchs.isEmpty) return defaultSketch.strokeSize;
    return _sketchs.last.strokeSize;
  }

  void updateSketchStrokeSize(double size) {
    // final newSketch = _sketchs.last.copyWith(penColor: penColor, points: []);
    // addNewSketch(newSketch);
  }

  
}
