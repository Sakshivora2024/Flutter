import 'package:flutter/material.dart';

class MyTabbar1 extends StatelessWidget {
  const MyTabbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("It is a contact tab, which is responsible for displaying the contacts stored in your mobile.",style: TextStyle(fontSize: 25),textAlign: TextAlign.justify,),
    );
  }
}
