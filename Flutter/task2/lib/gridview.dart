import 'package:flutter/material.dart';
import 'package:task2/ImageVideos.dart';

class GridViewGallery extends StatelessWidget {
  final List<ImageVideos>? imageVideo;
  const GridViewGallery({super.key, required this.imageVideo});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 12) / 2;
    final double itemWidth = size.width / 2;
    return Flexible(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: imageVideo!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: (itemWidth / itemHeight)),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: const Color.fromARGB(255, 203, 195, 227),
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    if (imageVideo![index].type != 'mp4') ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          imageVideo![index].image,
                          fit: BoxFit.fill,
                          height: 100,
                          width: 150,
                        ),
                      ),
                    ] else ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const SizedBox(
                          width: 150,
                          child: Icon(
                            Icons.video_collection_outlined,
                            size: 100,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${imageVideo![index].name!}',
                            style: const TextStyle(fontSize: 16),
                            maxLines: 2, overflow: TextOverflow.ellipsis,
                          ),
                          Text('Type: ${imageVideo![index].type!}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Bytes: ${imageVideo![index].bytes!}',
                              style: const TextStyle(fontSize: 16)),
                          Text('Media: ${imageVideo![index].media}',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
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
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
