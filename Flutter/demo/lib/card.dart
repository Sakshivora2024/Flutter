import 'package:flutter/material.dart';

class MyCardPage extends StatelessWidget {
  const MyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.play_circle_fill_sharp),
              title: Text("Bad Liar"),
              subtitle: Text("Imagine Dragons"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text("Play"),
                  onPressed:() {
                    print("Play song");
                  },
                ),
                const SizedBox(width: 10,),
                TextButton(
                  child: Text("Pause"),
                  onPressed:() {
                    print("Pause song");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
