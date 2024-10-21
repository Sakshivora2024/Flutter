import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      shrinkWrap: true,
      children: List.generate(choice.length, (index) {
        return Center(
            child: SelectCard(
          choice: choice[index],
        ));
      }),
    );
  }
}

class Choices {
  Choices({this.title, this.icon});
  final String? title;
  final IconData? icon;
}

List<Choices> choice = [
  Choices(title: "Home", icon: Icons.home),
  Choices(title: "Contact", icon: Icons.contacts),
  Choices(title: "Map", icon: Icons.map),
  Choices(title: "Phone", icon: Icons.phone),
  Choices(title: "Camera", icon: Icons.camera),
  Choices(title: "Setting", icon: Icons.settings),
  Choices(title: "Album", icon: Icons.photo_album),
  Choices(title: "Wifi", icon: Icons.wifi),
];

class SelectCard extends StatelessWidget {
  const SelectCard({super.key, required this.choice});
  final Choices choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Icon(
                  choice.icon,
                  size: 50.0,
                  color: Colors.grey,
            )),
            Text(
              choice.title!,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
