import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';

class splash extends StatefulWidget {
  final List<CameraDescription> cameras;

  splash(this.cameras);

  @override
  _splashState createState() => new _splashState();
}

class _splashState extends State<splash> {
  List<CameraDescription> cameras;

  void fetchcamera() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      print('Error: $e.code\nError Message: $e.message');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchcamera();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage(cameras)),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/sp.png',
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
                width: 170.0,
              ),
              Text("Object Detection",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),)
            ]),
      ),
    );
  }
}
