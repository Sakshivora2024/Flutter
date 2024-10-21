

import 'package:flutter/material.dart';

class MyCardForm extends StatefulWidget {
  const MyCardForm({super.key});

  @override
  State<MyCardForm> createState() => _MyCardFormState();
}

class _MyCardFormState extends State<MyCardForm> {
  final TextEditingController nameController = TextEditingController();
  List<String> student = ["Khushi", "Neha", "Nova"];

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
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    const Icon(Icons.list),
                    Text(student[index]),
                    const SizedBox(width: 50,),
                    IconButton(

                        onPressed: () {
                          setState(() {
                            student.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
              ),
            );
            // return ListTile(
            //   leading: Icon(Icons.list),
            //   trailing: IconButton(icon: Icon(Icons.delete),onPressed: (){
            //     setState(() {
            //       student.removeAt(index);
            //     });
            //
            //   },),
            //   title: Text("${student[index]}"),
            // );
          },
        ),
      ],
    );
  }
}
