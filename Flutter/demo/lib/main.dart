// import 'package:demo/card.dart';
// import 'package:demo/dropdown.dart';
// import 'package:demo/images.dart';
// import 'package:demo/snackbar.dart';
// import 'package:demo/cardform.dart';
// import 'package:demo/form.dart';
// import 'package:demo/formValidation.dart';
// import 'package:demo/gesturedetector.dart';
import 'package:demo/registrationform.dart';
// import 'package:demo/gridView.dart';
// import 'package:demo/snackbarone.dart';
// import 'package:demo/stack.dart';
// import 'package:demo/tabbar1.dart';
// import 'package:demo/tabbar2.dart';
// import 'package:demo/listview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Demo",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          // bottom: TabBar(tabs: [
          //   Tab(icon: Icon(Icons.contacts),text: "Tab1",),
          //   Tab(icon:Icon(Icons.camera_alt),text: "Tab2",)
          // ],),
          backgroundColor: Colors.blueAccent,
        ),
        body:
        // TabBarView(children: [MyTabbar1(),MyTabbar2()],)
        Center(
         child: Column( children:[
           // MyGrid(),
           // MySnackBar(),
           // MyGestureDetector(),
           // MyStack(),
           // FormValidation(),
           RegistrationForm(),
           // MyListForm(),
           // MyCardForm(),
           // ListViewBuilder(),
           // DropDowmListItem(),
           // SizedBox(height: 20,),
           // MyImages(),
           // SizedBox(height: 20,),
           // MySnackBarPage(),
           // SizedBox(height: 20,),
           // MyCardPage(),
         ]),
        ),
      ),
    );
  }
}
