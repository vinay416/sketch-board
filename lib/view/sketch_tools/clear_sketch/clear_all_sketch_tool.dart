import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/sketch_view_model.dart';

class ClearSketchTool extends StatelessWidget {
  const ClearSketchTool({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => ClearAlert(),
        );
      },
      icon: Icon(
        Icons.clear_all,
        color: Colors.red,
        size: 35,
      ),
    );
  }
}

class ClearAlert extends StatelessWidget {
  const ClearAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Alert"),
      content: Text("Confirm to clear sketch board"),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<SketchViewModel>().clearSketch();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: Text(
            "Clear",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
