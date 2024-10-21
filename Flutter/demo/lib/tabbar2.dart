import 'package:flutter/material.dart';

class MyTabbar2 extends StatelessWidget {
  const MyTabbar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("It is a second tab, which is responsible for displaying the data stored in your mobile.",style: TextStyle(fontSize: 25),textAlign: TextAlign.justify,),
    );
  }
}
