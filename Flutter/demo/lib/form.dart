

import 'package:flutter/material.dart';

class MyListForm extends StatefulWidget {
  const MyListForm({super.key});

  @override
  State<MyListForm> createState() => _MyListFormState();
}

class _MyListFormState extends State<MyListForm> {
  final TextEditingController nameController = TextEditingController();
  List<String> student = ["Khushi","Neha","Nova"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: "User name",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      student.add(nameController.text.toString());
                    });
                    nameController.clear();
                  },
                )),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: student.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
              trailing: IconButton(icon: const Icon(Icons.delete),onPressed: (){
                setState(() {
                  student.removeAt(index);
                });

              },),
              title: Text(student[index]),
            );
          },
        ),
      ],
    );
  }
}
