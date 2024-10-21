import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "World",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          width: 250.0,
          height: 100.0,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          // color: Colors.green,
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 4,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignOutside),
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              new BoxShadow(color: Colors.green,offset: new Offset(6.0, 6.0))
            ]
          ),
          transform: Matrix4.rotationZ(0.1),
          constraints: BoxConstraints.expand(height: 60.0),
          child: const Text(
            "Hello! I am Container Widget",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
