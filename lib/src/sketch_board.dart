import 'package:flutter/material.dart';

import '../model/sketch_paint_model.dart';

class SketchBoard extends StatelessWidget {
  const SketchBoard({
    super.key,
    this.boardColor = Colors.white,
    this.penColor = Colors.black,
    this.fillStroke = false,
    this.strokeSize = 4.0,
  });
  final Color boardColor;
  final Color penColor;
  final bool fillStroke;
  final double strokeSize;

  @override
  Widget build(BuildContext context) {
    return SketchGesture(
      paintModel: SketchPaintModel(
        points: [],
        penColor: penColor,
        fillStroke: fillStroke,
        strokeSize: strokeSize,
      ),
    );
  }
}

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

class SketchPainter extends CustomPainter {
  const SketchPainter({required this.sketchModel});
  final SketchPaintModel sketchModel;

  @override
  void paint(Canvas canvas, Size size) {
    if (sketchModel.points.isEmpty) return;

    final paint = Paint()
      ..color = sketchModel.penColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = sketchModel.strokeSize
      ..style =
          sketchModel.fillStroke ? PaintingStyle.fill : PaintingStyle.stroke;

    final path = Path();
    final p0 = sketchModel.points.first;
    //move the point to 1st offset
    path.moveTo(p0.dx, p0.dy);
    //add the moving getsure points
    for (var i = 1; i < sketchModel.points.length - 1; i++) {
      final p1 = sketchModel.points[i];
      final p2 = sketchModel.points[i + 1];

      final c1 = (p1.dx + p2.dx) / 2;
      final c2 = (p1.dy + p2.dy) / 2;
      path.quadraticBezierTo(c1, c2, p2.dx, p2.dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
