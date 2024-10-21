import 'package:flutter/material.dart';

class KeyboardFocusMode extends StatefulWidget {
  const KeyboardFocusMode({super.key});

  @override
  State<KeyboardFocusMode> createState() => _KeyboardFocusModeState();
}

class _KeyboardFocusModeState extends State<KeyboardFocusMode> {
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Center(
        child: TextField(
          // focusNode: _focusNode,
          decoration: const InputDecoration(labelText: 'Enter Text',border: OutlineInputBorder()),
        ),
      ),
    );
  }
}
