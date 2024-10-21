import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlutterSvg extends StatelessWidget {
  const FlutterSvg({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/image_svg.svg',height: 100,width: 100,),
    );
  }
}
