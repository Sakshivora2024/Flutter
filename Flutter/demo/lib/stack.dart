import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  const MyStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            height: 350,
            width: 350,
            color: Colors.deepPurpleAccent,
            child: Center(
              child: Text(
                "Middle Widget",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Container(
              height: 100,
              width: 150,
              color: Colors.greenAccent,
              child: Center(
                child: Text(
                  "Top Widget",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),Positioned(
            top: 30,
            left: 20,
            child: Container(
              height: 100,
              width: 150,
              color: Colors.deepOrangeAccent,
              child: Center(
                child: Text(
                  "Bottom Widget",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
