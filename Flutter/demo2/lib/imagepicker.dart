import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicking extends StatefulWidget {
  const ImagePicking({super.key});

  @override
  State<ImagePicking> createState() => _ImagePickingState();
}

class _ImagePickingState extends State<ImagePicking> {
  File? image;

  Future imagePic() async {
    try {
      final imagePic =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePic == null) return;
      setState(() {
        image = File(imagePic.path);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                imagePic();
              },
              child: const Text("Image Selected from Gallery")),
          const SizedBox(height: 20,),
          image != null ? Image.file(image!) : const Text("Please select image from gallery")
        ],
      ),
    );
  }
}
