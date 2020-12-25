import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
import 'bndbox.dart';
import 'models.dart';
import 'camera.dart';

class camerascreeen extends StatefulWidget {
  String model;
  final List<CameraDescription> cameras;

  camerascreeen(this.cameras, this.model);

  @override
  _camerascreeenState createState() => _camerascreeenState();
}

class _camerascreeenState extends State<camerascreeen> {
  @override
  void initState() {
    super.initState();
    _model = widget.model;
    onSelect(widget.model);
  }

  @override
  void dispose() {
    super.initState();
  }

  String _model;

  onSelect(model) {
    _model = widget.model;
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  loadModel() async {
    String res;
    switch (_model) {
      // case yolo:
      //   res = await Tflite.loadModel(
      //     model: "assets/yolov2_tiny.tflite",
      //     labels: "assets/yolov2_tiny.txt",
      //   );
      //   break;
      //
      // case mobilenet:
      //   res = await Tflite.loadModel(
      //       model: "assets/mobilenet_v1_1.0_224.tflite",
      //       labels: "assets/mobilenet_v1_1.0_224.txt");
      //   break;

      case posenet:
        res = await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt");
    }
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          children: [
            Camera(
              widget.cameras,
              _model,
              setRecognitions,
            ),
            BndBox(
                _recognitions == null ? [] : _recognitions,
                math.max(_imageHeight, _imageWidth),
                math.min(_imageHeight, _imageWidth),
                screen.height,
                screen.width,
                _model),
          ],
        ),
      ),
    );
  }
}
