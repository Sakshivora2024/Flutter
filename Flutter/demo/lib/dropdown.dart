import 'package:flutter/material.dart';

class DropDowmListItem extends StatefulWidget {
  const DropDowmListItem({super.key});

  @override
  State<DropDowmListItem> createState() => _DropDowmListItemState();
}

class _DropDowmListItemState extends State<DropDowmListItem> {
  String? dropdowmval;
  List<String> list = ["India", "Japan", "Thailand", "Brazil", "Switzerland"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          DropdownButton(
            hint: const SizedBox(
              width: 150,
              child: Text("Select",style: TextStyle(fontSize: 25),),
            ),
            value: dropdowmval,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: list.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item,style: const TextStyle(fontSize: 25),),
              );
            }).toList(),

            onChanged: (String? value) {
              setState(() {
                dropdowmval = value.toString();
              });
            },

          )
        ],
      ),
    );
  }
}
