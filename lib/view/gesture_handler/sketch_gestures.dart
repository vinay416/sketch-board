import 'package:canvas_paint/view_model/sketch_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/sketch_paint_model.dart';
import '../sketch_painter/sketch_painter.dart';

class SketchGesture extends StatefulWidget {
  const SketchGesture({super.key});

  @override
  State<SketchGesture> createState() => _SketchGestureState();
}

class _SketchGestureState extends State<SketchGesture> {
  late SketchViewModel sketchVM;

  @override
  void initState() {
    super.initState();
    sketchVM = context.read<SketchViewModel>();
    sketchVM.addNewSketch(sketchVM.defaultSketch, notify: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SketchViewModel>(
      builder: (context, vm, child) {
        final currentSketch = vm.sketchs.last;
        return Stack(
          children: [
            ...buildAllSketch(vm.sketchs),
            buildCurrentSketch(currentSketch),
          ],
        );
      },
    );
  }

  List<Widget> buildAllSketch(List<SketchPaintModel> sketchs) {
    return sketchs.sublist(0, sketchs.length - 1).map(buildBoard).toList();
  }

  Widget buildCurrentSketch(SketchPaintModel sketchModel) {
    return Listener(
      onPointerDown: (event) => onGestureMove(event, sketchModel),
      onPointerMove: (event) => onGestureMove(event, sketchModel),
      onPointerUp: (event) {
        final newSketch = sketchVM.sketchs.last.copyWith(points: []);
        sketchVM.addNewSketch(newSketch);
      },
      child: buildBoard(sketchModel),
    );
  }

  void onGestureMove(PointerEvent event, SketchPaintModel sketchModel) {
    final rendreBox = context.findRenderObject() as RenderBox;
    final offset = rendreBox.globalToLocal(event.position);
    sketchModel.points.add(offset);
    sketchVM.updatePainter();
  }

  RepaintBoundary buildBoard(SketchPaintModel sketchModel) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: SketchPainter(sketchModel: sketchModel),
        child: const SizedBox(
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
