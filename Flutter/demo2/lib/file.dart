import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePicking extends StatefulWidget {
  const FilePicking({super.key});

  @override
  State<FilePicking> createState() => _FilePickingState();
}

class _FilePickingState extends State<FilePicking> {
  PlatformFile? file;
  String? size;
  // Single File
  Future<void> pickSingleFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result != null){
      print(result.files.first.name);
      file = result.files.first;
      final kb = file!.size / 1024;
      final mb = kb / 1024;
      final size = (mb >= 1) ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
      this.size = size;
      setState(() {});
    }
    else{
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Select File")));
    }
  }

  getMultipleFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true,allowedExtensions: ['jpg','png'],type: FileType.custom);

    if(result != null){
        List<File?> file = result.paths.map((path) => File(path!)).toList();
        files = file;
        setState(() {

        });
    }
    else{
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Select File")));
        }
  }

  List<File?> files = [];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        children: [
          file == null ? Text('No File Found') : Column(children: [
            Text('Name - ${file!.name}'),
            Text('Size - $size'),
            Text('Extension - ${file!.extension}')
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                file != null ? "File Name:- " : "No File is Selected",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                file != null ? file!.path!.split("/").last : "",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),

          ListView.builder(itemBuilder: (BuildContext context,int index){
            return ListTile(
              title: Text(files[index]!.path.split("/").last,style: const TextStyle(color: Colors.black), textAlign: TextAlign.center),
            );
          },itemCount: files.length,shrinkWrap: true,),
          ElevatedButton(onPressed: pickSingleFile, child: const Text("Select File"))
        ],
      ),
    );
  }
}
