import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task2/ImageVideos.dart';
import 'package:task2/gridview.dart';
import 'package:task2/list.dart';
import 'package:task2/slider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? selectedValue;
  List<String> views = ['ListView', 'GridView', 'SliderView'];
  final List<ImageVideos> imageVideo = [];

  void showSheet(context){
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(150, 203, 195, 227),
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              cameraPic();
                            },
                            icon: const Icon(
                              Icons.camera_alt_sharp,
                              size: 50,
                            )),
                        const Text(
                          'Camera',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              galleryPic();
                            },
                            icon: const Icon(
                              Icons.browse_gallery_sharp,
                              size: 50,
                            )),
                        const Text(
                          'Gallery',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              videoPic();
                            },
                            icon: const Icon(
                              Icons.video_camera_back_sharp,
                              size: 50,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Video',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  void galleryPic() async {
    final galleryPicked =
    await ImagePicker().pickImage(source: ImageSource.gallery,);
    if (galleryPicked == null) return;
    mediaPic([galleryPicked], 'Gallery');
  }

  void cameraPic() async {
    final cameraPicked =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (cameraPicked == null) return;
    mediaPic([cameraPicked], 'Camera');
  }

  void videoPic() async {
    final videoPicked = await ImagePicker().pickMultipleMedia();
    if (videoPicked == null) return;
    mediaPic(videoPicked, 'Video');
  }

  void mediaPic(multiMedia, mediaValue) {
    File image;
    int byte;
    String type, name, media, bytes;
    double kb, mb;


    for (var i = 0; i < multiMedia.length; i++) {
      image = File(multiMedia[i].path);
      type = multiMedia[i].path.split(".").last;
      name = multiMedia[i].path.split("/").last;
      byte = File(multiMedia[i].path).lengthSync();
      media = mediaValue;
      kb = byte / 1024;
      mb = kb / 1024;
      bytes = (mb >= 1)
          ? '${mb.toStringAsFixed(2)} MB'
          : '${kb.toStringAsFixed(2)} KB';

        ImageVideos gallery = ImageVideos(image, type, name, bytes, media);
        imageVideo.add(gallery);
        setState(() {});

    // if (mediaValue != 'Video') {
    //   image = File(multiMedia.path);
    //   type = multiMedia.path.split(".").last;
    //   name = multiMedia.path.split("/").last;
    //   byte = File(multiMedia.path).lengthSync();
    //   media = mediaValue;
    //   kb = byte / 1024;
    //   mb = kb / 1024;
    //   bytes = (mb >= 1)
    //       ? '${mb.toStringAsFixed(2)} MB'
    //       : '${kb.toStringAsFixed(2)} KB';
    //   setState(() {
    //     ImageVideos camera = ImageVideos(image, type, name, bytes, media);
    //     imageVideo.add(camera);
    //   });
    // } else {
    //   // for (var i = 0; i < multiMedia.length; i++) {
    //   //   image = File(multiMedia[i].path);
    //   //   type = multiMedia[i].path.split(".").last;
    //   //   name = multiMedia[i].path.split("/").last;
    //   //   byte = File(multiMedia[i].path).lengthSync();
    //   //   media = mediaValue;
    //   //   kb = byte / 1024;
    //   //   mb = kb / 1024;
    //   //   bytes = (mb >= 1)
    //   //       ? '${mb.toStringAsFixed(2)} MB'
    //   //       : '${kb.toStringAsFixed(2)} KB';
    //   //   if (type == 'mp4') {
    //   //     ImageVideos gallery = ImageVideos(image, type, name, bytes, media);
    //   //     imageVideo.add(gallery);
    //   //     setState(() {});
    //   //   }
    //   }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Galleria'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButton(
              value: selectedValue,
              hint: const Text('Views'),
              isExpanded: true,
              borderRadius: BorderRadius.circular(25),
              items: views
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (value) => setState(() {
                selectedValue = value;
              }),
            ),
            Builder(
              builder: (context) {
                switch (selectedValue) {
                  case 'ListView':
                    return ListViewGallery(imageVideo: imageVideo);
                  case 'GridView':
                    return GridViewGallery(imageVideo: imageVideo);
                  case 'SliderView':
                    return SliderViewGallery(imageVideo: imageVideo);
                  default:
                    return ListViewGallery(imageVideo: imageVideo);
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showSheet(context);
          // showModalBottomSheet(
          //     backgroundColor: const Color.fromARGB(150, 203, 195, 227),
          //     context: context,
          //     builder: (BuildContext context) {
          //       return Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Container(
          //             padding: const EdgeInsets.all(10.0),
          //             decoration: BoxDecoration(
          //               shape: BoxShape.rectangle,
          //               borderRadius: BorderRadius.circular(20.0),
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Column(
          //                   children: [
          //                     IconButton(
          //                         onPressed: () {
          //                           Navigator.pop(context);
          //                           cameraPic();
          //                         },
          //                         icon: const Icon(
          //                           Icons.camera_alt_sharp,
          //                           size: 50,
          //                         )),
          //                     const Text(
          //                       'Camera',
          //                       style: TextStyle(fontSize: 16),
          //                     ),
          //                   ],
          //                 ),
          //                 const SizedBox(
          //                   width: 10,
          //                 ),
          //                 Column(
          //                   children: [
          //                     IconButton(
          //                         onPressed: () {
          //                           Navigator.pop(context);
          //                           galleryPic();
          //                         },
          //                         icon: const Icon(
          //                           Icons.browse_gallery_sharp,
          //                           size: 50,
          //                         )),
          //                     const Text(
          //                       'Gallery',
          //                       style: TextStyle(fontSize: 16),
          //                     ),
          //                   ],
          //                 ),
          //                 const SizedBox(
          //                   width: 10,
          //                 ),
          //                 Column(
          //                   children: [
          //                     IconButton(
          //                         onPressed: () {
          //                           Navigator.pop(context);
          //                           videoPic();
          //                         },
          //                         icon: const Icon(
          //                           Icons.video_camera_back_sharp,
          //                           size: 50,
          //                         )),
          //                     const SizedBox(
          //                       height: 10,
          //                     ),
          //                     const Text(
          //                       'Video',
          //                       style: TextStyle(fontSize: 16),
          //                     ),
          //                   ],
          //                 )
          //               ],
          //             ),
          //           ),
          //         ],
          //       );
          //     });
        },
      ),
    );
  }
}

