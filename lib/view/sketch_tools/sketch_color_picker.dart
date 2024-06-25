import 'package:canvas_paint/view_model/sketch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class SketchColorPicker extends StatelessWidget {
  const SketchColorPicker._();

  static Widget colorizer(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const SketchColorPicker._(),
        );
      },
      icon: Selector<SketchViewModel, Color>(
        selector: (p0, p1) => p1.currentPenColor,
        builder: (context, currentPenColor, child) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: currentPenColor, width: 5),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: Transform.translate(
              offset: const Offset(-6, -7),
              child: Icon(
                Icons.colorize,
                color: currentPenColor,
                size: 20,
              ),
            ),
          );
        },
      ),
    );
  }

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
