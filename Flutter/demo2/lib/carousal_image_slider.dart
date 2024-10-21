import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousalSlider extends StatefulWidget {
  const CarousalSlider({super.key});

  @override
  State<CarousalSlider> createState() => _CarousalSliderState();
}

class _CarousalSliderState extends State<CarousalSlider> {
  List<String> image = [
    'https://t4.ftcdn.net/jpg/02/56/10/07/360_F_256100731_qNLp6MQ3FjYtA3Freu9epjhsAj2cwU9c.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5ImBBOokXQjOmRAc0SnZVmgGl3nBJz9vjMg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK0QitdQqAk25mamhaa12x-UYXCl6z6aQQDg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4P5Om62afIO5zCyRYGjwUqD22KsqpY9IXfg&s',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 400.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.easeInOutCirc,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(microseconds: 800),
          viewportFraction: 0.8),
      items: image
          .map((String item) => Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: item,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        )),
                  ),
                  key: UniqueKey(),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  //     Container(
                  //   padding: const EdgeInsets.all(20),
                  //   child: const Text(
                  //     "Loading....",
                  //     style:
                  //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  errorWidget: (context, index, error) => Container(
                    color: Colors.black12,
                    child: const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 80,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
