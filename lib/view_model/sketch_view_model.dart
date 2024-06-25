import 'package:canvas_paint/model/sketch_paint_model.dart';
import 'package:flutter/material.dart';

import '../utils/sketch_default.dart';

class SketchViewModel with ChangeNotifier {
  List<SketchPaintModel> _sketchs = [];
  List<SketchPaintModel> get sketchs => List.unmodifiable(_sketchs);

  void addNewSketch(SketchPaintModel sketch, {bool notify = true}) {
    _sketchs = [..._sketchs, sketch];
    if (notify) notifyListeners();
  }

  void clearSketch() {
    _sketchs = [];
    notifyListeners();
  }

  void updatePainter() => notifyListeners();

  Color get currentPenColor {
    if(_sketchs.isEmpty) return SketchDefault.penColor;
    return _sketchs.last.penColor;
  }

  void updateSketchColor(Color penColor) {
    final newSketch = _sketchs.last.copyWith(penColor: penColor, points: []);
    addNewSketch(newSketch);
  }
}
