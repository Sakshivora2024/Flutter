import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileTypePicker extends StatefulWidget {
  const FileTypePicker({super.key});

  @override
  State<FileTypePicker> createState() => _FileTypePickerState();
}

class _FileTypePickerState extends State<FileTypePicker> {
  PlatformFile? file;
  List<String> fileType = ['Any', 'Image', 'Audio', 'Video', 'Custom', 'Media'];
  String selectedValue = 'Any';
  FileType myFileType = FileType.any;
  TextEditingController textController = TextEditingController(text: 'png');
  List<String> extensionType = ['png'];
  String? size;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: myFileType,
        allowedExtensions:
            myFileType == FileType.custom ? extensionType : null);
    if (result != null) {
      file = result.files.first;
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please Select File")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'File Type',
                  style: TextStyle(
                      color: Color.fromARGB(255, 30, 31, 30),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton(
                    value: selectedValue,
                    items: fileType
                        .map((String item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                        if (value == fileType[0]) {
                          myFileType = FileType.any;
                        }
                        if (value == fileType[1]) {
                          myFileType = FileType.image;
                        }
                        if (value == fileType[2]) {
                          myFileType = FileType.audio;
                        }
                        if (value == fileType[3]) {
                          myFileType = FileType.video;
                        }
                        if (value == fileType[4]) {
                          myFileType = FileType.custom;
                        }
                        if (value == fileType[5]) {
                          myFileType = FileType.media;
                        }
                      });
                    })
              ],
            ),
            myFileType == FileType.custom
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: TextField(
                      controller: textController,
                      decoration:
                          const InputDecoration(hintText: 'Extension Type'),
                      onSubmitted: (value) {
                        extensionType.clear();
                        extensionType.addAll(value.split(',').toList());
                      },
                    ),
                  )
                : const SizedBox(
                    height: 20,
                  ),
            ElevatedButton(onPressed: pickFile, child: const Text('Select File')),
            SizedBox(height: 20,),
        Text(
              file != null ? file!.path!.split("/").last : "",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
