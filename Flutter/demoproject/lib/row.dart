import 'package:flutter/material.dart';

void main() {
  runApp(const MyRows());
}

class MyRows extends StatelessWidget {
  const MyRows({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RowsPage(),
    );
  }
}

class RowsPage extends StatefulWidget {
  const RowsPage({super.key});

  @override
  State<RowsPage> createState() => _RowState();
}

class _RowState extends State<RowsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Row",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(12.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            child: const Text(
              "Python",
              style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            child: const Text(
              "Java",
              style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            child: const Text(
              "MySQL",
              softWrap: true,
              style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
