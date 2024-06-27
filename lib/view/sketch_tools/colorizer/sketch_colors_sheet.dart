import 'package:canvas_paint/view_model/sketch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class SketchColorsSheet extends StatelessWidget {
  const SketchColorsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final sketchVM = context.read<SketchViewModel>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialPicker(
        pickerColor: sketchVM.currentPenColor,
        onColorChanged: sketchVM.updateSketchColor,
      ),
    );
  }
}
