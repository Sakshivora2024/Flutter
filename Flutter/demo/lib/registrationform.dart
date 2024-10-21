import 'package:flutter/material.dart';

enum gender { Male, Female, Others }

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // Map<String, bool> values = {
  //   "Reading": false,
  //   "Music": false,
  //   "Art": false,
  // };

  final List<CheckBoxModel> _values = [
    CheckBoxModel("Read", false),
    CheckBoxModel("Music", false),
    CheckBoxModel("Art", false),
    // CheckBoxModel("Swim", false),
  ];

  final List<GenderModel> _value = [
    GenderModel("Male", 1),
    GenderModel("Female", 2),
    GenderModel("Others", 3),
  ];

  int _selectedValue = 1;
  // int id = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "REGISTRATION FORM",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  hintText: "First Name",
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  hintText: "Last Name",
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                const Text(
                  "Hobbies",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Row(
                      children: _values
                          .map((CheckBoxModel item) => Expanded(
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(horizontal: -4.0,vertical: -4.0),
                              contentPadding: const EdgeInsets.all(0),
                                  title: Text(item.title!),
                                  value: item.isChecked,
                                  onChanged: (value) => setState(() {
                                    item.isChecked = value!;
                                  }),
                                ),
                          ))
                          .toList()),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Gender",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Row(
                          children: _value.map((GenderModel gender) =>
                              Expanded(
                                child: RadioListTile(
                                  visualDensity: const VisualDensity(horizontal: -4.0),
                                  contentPadding: const EdgeInsets.all(0),
                                  title: Text("${gender.name}"),
                                    value: gender.index,
                                    groupValue: _selectedValue,
                                    onChanged: (value) => setState(() {
                                      _selectedValue = value!;
                                    }),
                                ),
                              )
                          ).toList(),
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class CheckBoxModel {
  String? title;
  bool? isChecked;

  CheckBoxModel(this.title, this.isChecked);
}

class GenderModel {
  String? name;
  int? index;

  GenderModel(this.name, this.index);
}

