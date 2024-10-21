import 'package:demoproject/container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState() => _MyButton();
}

class _MyButton extends State<MyApp> {
  Choice _selectedOption = choices[0];
  int _volume = 0;
  double _volumeup = 0.0;

  void _select(Choice choice) {
    setState(() {
      _selectedOption = choice;
    });
  }

  
  String defaultValue = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Button",
          ),
          actions: [
            PopupMenuButton(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(0).map((Choice choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice.name ?? "No Value"),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25),
                child: TextButton(
                  child: Text(
                    "Text Button",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    print("Text Button Clicked");
                  },
                  style: TextButton.styleFrom(elevation: 2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: ElevatedButton(
                    child: Text(
                      "Elevated Button",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print("Elevated Button Clicked");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        backgroundColor: Colors.green,
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: OutlinedButton(
                  child: Text(
                    "Outlined Button",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    print("OutLined Button Clicked");
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ChoiceCard(choice: _selectedOption),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: Icon(Icons.ring_volume,size: 40,),
                  splashColor: Colors.white,

                  onTap: () {
                    setState(() {
                      _volume += 1;
                    });
                  },
                ),
              ),
              Text(
                _volume.toString(),style: TextStyle(fontSize: 50),
              ),
              Padding(padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(Icons.volume_up,size: 40,),
                  onPressed: () {
                    setState(() {
                      _volumeup += 5;
                    });
                  },
                ),
              ),
              Text("Volume $_volumeup"),

            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.name, this.icon});
  final String? name;
  final IconData? icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(name: 'Wifi', icon: Icons.wifi),
  const Choice(name: 'Bluetooth', icon: Icons.bluetooth),
  const Choice(name: 'Battery', icon: Icons.battery_alert),
  const Choice(name: 'Storage', icon: Icons.storage),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({super.key, required this.choice});

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.greenAccent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(choice.icon, size: 100.0, color: Colors.white),
            Text(choice.name ?? "No Value",
                style: TextStyle(color: Colors.black))
          ],
        ),
      ),
    );
  }
}
