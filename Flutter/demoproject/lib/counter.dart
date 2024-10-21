import 'package:flutter/material.dart';

class counter extends StatelessWidget {

  final count;
  counter({required this.count});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Text(
            "Welcome to World!!! $count",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
    );


  }
}