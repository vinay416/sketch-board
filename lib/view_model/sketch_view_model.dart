import 'package:canvas_paint/model/sketch_paint_model.dart';
import 'package:canvas_paint/model/sketch_paint_type.dart';
import 'package:flutter/material.dart';

import '../utils/sketch_default.dart';

class SketchViewModel with ChangeNotifier {
  SketchViewModel() {
    addNewSketch(defaultSketch);
  }
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

  void updatePainter() => notifyListeners();

  //* Color tool
  Color get currentPenColor {
    return _sketchs.last.penColor;
  }

  void updateSketchColor(Color penColor) {
    final newSketch = _sketchs.last.copyWith(penColor: penColor, points: []);
    _updateSketch(newSketch);
  }

  //* Stroke tool
  double get currentStrokeSize {
    return _sketchs.last.strokeSize;
  }

  List<double> get strokeSizes => SketchDefault.strokes;

  void updateSketchStrokeSize(double size) {
    final newSketch = _sketchs.last.copyWith(strokeSize: size, points: []);
    _updateSketch(newSketch);
  }

  //* Shape tool
  SketchPaintType get currentShape {
    return _sketchs.last.type;
  }

  List<SketchPaintType> get strokeShapes => SketchPaintType.values;

  void updateSketchShape(SketchPaintType shape) {
    final newSketch = _sketchs.last.copyWith(type: shape, points: []);
    _updateSketch(newSketch);
  }

  //* Undo/Redo sketch
  SketchPaintModel? _undoSketch;

  bool get undoAvailable => _sketchs.length > 1;
  bool get redoAvailable => _undoSketch != null;

  void onTapUndo() {
    _undoSketch = _sketchs.elementAt(_sketchs.length - 2);
    final copySketchs = [...sketchs];
    copySketchs.remove(_undoSketch);
    if (copySketchs.isEmpty) {
      _sketchs = [defaultSketch];
    } else {
      _sketchs = [...copySketchs];
    }
    notifyListeners();
  }

  void onTapRedo() {
    final List<SketchPaintModel> temp = [..._sketchs];
    temp.insert(_sketchs.length - 1, _undoSketch!);
    _sketchs = [...temp];
    _undoSketch = null;
    notifyListeners();
  }

  //* update Sketch
  void _updateSketch(SketchPaintModel newSketch) {
    if (_sketchs.last.points.isEmpty) {
      _sketchs.removeLast();
      addNewSketch(newSketch);
      return;
    }
    addNewSketch(newSketch);
  }

  //* Clear all sketch
  void clearSketch() {
    _sketchs = [defaultSketch];
    _undoSketch = null;
    notifyListeners();
  }
}
