import 'package:flutter/material.dart';

class MyImages extends StatelessWidget {
  const MyImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          // Image.asset('assets/space1.jfif'),
          FadeInImage.assetNetwork(
              placeholder: 'assets/space1.jfif',
              image: 'https://media.istockphoto.com/id/1269949331/photo/milky-way-arch-fantastic-night-landscape-with-bright-arched-milky-way-purple-sky-with-stars.jpg?s=1024x1024&w=is&k=20&c=SrxUXs8KgRRjUCz8I8U_Es37AA3fmYXtnX-k1dcn228='
          ),
          // const SizedBox(height: 15),
          Text("It all about a space",style: TextStyle(fontSize: 25.0),),
        ],
      ),
    );
  }
}
