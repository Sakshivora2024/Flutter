import 'package:flutter/material.dart';

class TimePicking extends StatefulWidget {
  const TimePicking({super.key});

  @override
  State<TimePicking> createState() => _TimePickingState();
}

class _TimePickingState extends State<TimePicking> {
  TimeOfDay? _time = TimeOfDay.now();
  void _selectTime() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context,Widget? child){
        return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: child!);
      }
    );
    if(timeOfDay != null){
      setState(() {
        _time = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _selectTime,
            child: const Text('Select Time'),
          ),
          const SizedBox(height: 8,),
          Text('Selected time: ${_time?.format(context)}'),
        ],
      ),
    );
  }
}
