import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MytextPage(),
    );
  }
}

class MytextPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Rich Text",
        ),
      ),
      body: Container(
        child: Center(
          child: RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(color: Colors.black,fontSize: 20),
              children: <TextSpan>[
                TextSpan(text: 'SignUp',style: TextStyle(color: Colors.blueAccent,fontSize: 20),
                recognizer: TapGestureRecognizer()
                ..onTap = (){}),
              ]
            ),
          ),
        ),
      ),
    );
  }
}