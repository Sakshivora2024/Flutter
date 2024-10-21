import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task2/ImageVideos.dart';
import 'package:task2/video.dart';

class SliderViewGallery extends StatelessWidget {
  final List<ImageVideos>? imageVideo;
  const SliderViewGallery({super.key, required this.imageVideo});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imageVideo!.length,
        itemBuilder: (context, index, realIndex) {
          if (imageVideo![index].type != 'mp4') {
            return Container(
              height: 1200,
              constraints: const BoxConstraints(maxHeight: 900),
              color: const Color.fromARGB(255, 203, 195, 227),
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            imageVideo![index].image,
                            fit: BoxFit.fill,
                            height: 250,
                            width: 250,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${imageVideo![index].name!}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('Type: ${imageVideo![index].type!}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text('Bytes: ${imageVideo![index].bytes!}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text('Media: ${imageVideo![index].media}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return VideoPlayerShow(path: imageVideo![index].image);
          }
        },
        options: CarouselOptions(
            height: 500.0, enableInfiniteScroll: false, autoPlay: false));
  }
}
