import 'package:flutter/material.dart';

class MySnackBarPage extends StatelessWidget {
  const MySnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextButton(
        child: Text(
          "Show SnackBar",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent, elevation: 2),
        onPressed: () {
          final snackbar = SnackBar(
            content: Text("This is Snack Bar message"),
            duration: const Duration(minutes: 5),
            action: SnackBarAction(label: "Undo", onPressed: () {}),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
      ),
    );

  }
}
