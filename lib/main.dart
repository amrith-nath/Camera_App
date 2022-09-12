import 'package:camera_app/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main(List<String> args) {
  runApp(MyCameraApp());
}

class MyCameraApp extends StatelessWidget {
  const MyCameraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'MyCamera',
      home: HomePage(),
    );
  }
}
