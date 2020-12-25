import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// import 'package:objectdetection/pickgallery.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
import 'camera screen.dart';
import 'camera.dart';
import 'bndbox.dart';
import 'models.dart';
import 'pickgallery.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<dynamic> _recognitions;
  // int _imageHeight = 0;
  // int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  navigateToHome(model) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => camerascreeen(widget.cameras, model),
        ));
  }

  // loadModel() async {
  //   String res;
  //   switch (_model) {
  //     case yolo:
  //       res = await Tflite.loadModel(
  //         model: "assets/yolov2_tiny.tflite",
  //         labels: "assets/yolov2_tiny.txt",
  //       );
  //       break;
  //
  //     case mobilenet:
  //       res = await Tflite.loadModel(
  //           model: "assets/mobilenet_v1_1.0_224.tflite",
  //           labels: "assets/mobilenet_v1_1.0_224.txt");
  //       break;
  //
  //     case posenet:
  //       res = await Tflite.loadModel(
  //           model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
  //       break;
  //
  //     default:
  //       res = await Tflite.loadModel(
  //           model: "assets/ssd_mobilenet.tflite",
  //           labels: "assets/ssd_mobilenet.txt");
  //   }
  //   print(res);
  // }
  //
  // onSelect(model) {
  //   setState(() {
  //     _model = model;
  //   });
  //   loadModel();
  // }

  // setRecognitions(recognitions, imageHeight, imageWidth) {
  //   setState(() {
  //     _recognitions = recognitions;
  //     _imageHeight = imageHeight;
  //     _imageWidth = imageWidth;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Welcome"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.4,
                child: RaisedButton(
                  color: Colors.cyan.shade300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.qr_code_scanner),
                      Text("Detect Object"),
                    ],
                  ),
                  onPressed: () => navigateToHome(ssd),
                ),
              ),
              // RaisedButton(
              //   child: const Text(yolo),
              //   onPressed: () => navigateToHome(yolo),
              // ),
              // RaisedButton(
              //   child: const Text(mobilenet),
              //   onPressed: () => navigateToHome(posenet),
              // ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 100,
                child: RaisedButton(
                  color: Colors.cyan.shade300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person_search_outlined),
                      Text("Detect Person"),
                    ],
                  ),
                  onPressed: () => navigateToHome(posenet),
                ),
              ),
            ],
          ),
        ));
  }
}
