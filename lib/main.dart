import 'package:canvas_paint/view/sketch_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/sketch_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SketchViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Sktech Board"),
            toolbarHeight: 40,
          ),
          body: const SketchBoard(),
        ),
      ),
    );
  }
}
