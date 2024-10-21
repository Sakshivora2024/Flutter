import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  const MySnackBar({super.key});

  @override
  State<MySnackBar> createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  var lists = List<String>.generate(12, (index) => "List ${index}");
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(lists[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showSnackBar(context, index);
                },
              ),
            );
          }),
    );
  }

  void showSnackBar(BuildContext context, int index) {
    var deleteRecord = lists[index];
    setState(() {
      lists.removeAt(index);
    });
    SnackBar snackbar = SnackBar(
      content: Text("Deleted ${deleteRecord}"),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: () => setState(() {
          lists.insert(index, deleteRecord);
        }),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
