import 'dart:io';

import 'package:file_picker/file_picker.dart';

class ImageVideos{
  File image;
  String? type;
  String? name;
  String? bytes;
  String media;

  ImageVideos(this.image,this.type,this.name,this.bytes,this.media);

  @override
  String toString() {
  return '{image:$image,type:$type,name:$name,bytes:$bytes,media:$media}';
  }
}