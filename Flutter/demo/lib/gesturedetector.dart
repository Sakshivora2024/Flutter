import 'package:flutter/material.dart';

class MyGestureDetector extends StatefulWidget {
  const MyGestureDetector({super.key});

  @override
  State<MyGestureDetector> createState() => _MyGestureDetectorState();
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  Color _backdoundColor = Colors.blueAccent;

  void _colorChangeOnSwipe(DragUpdateDetails details){
    if(details.delta.dx > 0){
      setState(() {
        _backdoundColor = Colors.cyan;
      });
    }
    if(details.delta.dx < 0){
      setState(() {
        _backdoundColor = Colors.deepPurpleAccent;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onHorizontalDragUpdate: _colorChangeOnSwipe,
        child: Container(
          color: _backdoundColor,
          height: 100,
          width: 100,child: const Text("Swipe Me",style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),

        ),
      ),
    );
  }
}
