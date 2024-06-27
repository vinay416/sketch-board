import 'package:canvas_paint/view/sketch_tools/pen_strokes/stroke_brush_icon.dart';
import 'package:canvas_paint/view_model/sketch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SketchStrokeSizes extends StatelessWidget {
  const SketchStrokeSizes({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SketchViewModel>();
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: vm.strokeSizes.length,
      itemBuilder: (context, index) {
        final strokeSize = vm.strokeSizes[index];
        return GestureDetector(
          onTap: () {
            vm.updateSketchStrokeSize(strokeSize);
            Navigator.pop(context);
          },
          child: CustomPaint(
            painter: StrokeBrushIcon(strokeSize: strokeSize),
            child: const SizedBox(
              height: 100,
              width: double.infinity,
            ),
          ),
        );
      },
    );
  }
}
