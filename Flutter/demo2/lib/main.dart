import 'package:demo2/cached_image_network.dart';
import 'package:demo2/carousal_image_slider.dart';
import 'package:demo2/keyboardFocus.dart';
import 'package:demo2/fluttersvg.dart';
import 'package:demo2/file.dart';
import 'package:demo2/filetype.dart';
import 'package:demo2/imagepicker.dart';
import 'package:demo2/timepicker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:
      // const KeyboardFocusMode(),
      // CarousalSlider()
      // FlutterSvg(),
      // CachedImageNetwork(),
      ImagePicking(),
      // FileTypePicker()
      // FilePicking(),
      // TimePicking(),
    );
  }
}
