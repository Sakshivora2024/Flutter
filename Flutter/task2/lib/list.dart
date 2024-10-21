import 'package:flutter/material.dart';
import 'package:task2/ImageVideos.dart';

class ListViewGallery extends StatelessWidget {
  final List<ImageVideos>? imageVideo;
  const ListViewGallery({super.key, required this.imageVideo});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: imageVideo?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: const Color.fromARGB(255, 203, 195, 227),
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (imageVideo![index].type != 'mp4') ...[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              imageVideo![index].image,
                              fit: BoxFit.fill,
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ] else ...[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Icon(
                              Icons.video_collection_outlined,
                              size: 80,
                            ),
                          ),
                        ],
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: ${imageVideo![index].name!}',
                                  style: const TextStyle(fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text('Type: ${imageVideo![index].type!}',
                                    style: const TextStyle(fontSize: 15)),
                                Text('Bytes: ${imageVideo![index].bytes!}',
                                    style: const TextStyle(fontSize: 15)),
                                Text('Media: ${imageVideo![index].media}',
                                    style: const TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {},
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
