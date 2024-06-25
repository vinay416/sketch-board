import 'package:flutter/material.dart';

import '../model/sketch_paint_model.dart';
import 'sketch_painter.dart';

class SketchGesture extends StatefulWidget {
  const SketchGesture({super.key, required this.paintModel});
  final SketchPaintModel paintModel;

  @override
  State<SketchGesture> createState() => _SketchGestureState();
}

class _SketchGestureState extends State<SketchGesture> {
  List<SketchPaintModel> sketchs = [];
  int currentSketchIndex = 0;

  @override
  void initState() {
    sketchs.add(widget.paintModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...buildAllSketch(),
        currentSketch(sketchs[currentSketchIndex]),
      ],
    );
  }

  List<Widget> buildAllSketch() {
    return sketchs.sublist(0, sketchs.length - 1).map(buildBoard).toList();
  }

  Widget currentSketch(SketchPaintModel sketchModel) {
    return Listener(
      onPointerDown: (event) => onGestureMove(event, sketchModel),
      onPointerMove: (event) => onGestureMove(event, sketchModel),
      onPointerUp: (event) {
        sketchs.add(widget.paintModel.copyWith(points: []));
        currentSketchIndex = sketchs.length - 1;
        setState(() {});
      },
      child: buildBoard(sketchModel),
    );
  }

  void onGestureMove(PointerEvent event, SketchPaintModel sketchModel) {
    final rendreBox = context.findRenderObject() as RenderBox;
    final offset = rendreBox.globalToLocal(event.position);
    sketchModel.points.add(offset);
    setState(() {});
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