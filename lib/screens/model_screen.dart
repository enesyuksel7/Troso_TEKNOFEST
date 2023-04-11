import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class ModelScreen extends StatefulWidget {
  final String modelPath;

  const ModelScreen({Key? key, required this.modelPath}) : super(key: key);

  @override
  _ModelScreenState createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  late Object obje;

  @override
  void initState() {
    super.initState();
    obje = Object(fileName: widget.modelPath);
    obje.rotation.setValues(0, 90, 0);
    obje.updateTransform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D Model Viewer'),
      ),
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(obje);
            scene.camera.zoom = 10;
          },
        ),
      ),
    );
  }
}
