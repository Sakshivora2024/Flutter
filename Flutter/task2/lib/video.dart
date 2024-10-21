import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerShow extends StatefulWidget {
  final File? path;
  const VideoPlayerShow({super.key, required this.path});

  @override
  State<VideoPlayerShow> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerShow> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    print(widget.path!);
    super.initState();
    _controller = VideoPlayerController.file(widget.path!)
      ..initialize().then((_) {
        setState(() {});
        // _controller?.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: _controller!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : Container()),
        Positioned(
            child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller!.value.isPlaying
                  ? _controller!.pause()
                  : _controller!.play();
            });
          },
          child: Icon(
              _controller!.value.isPlaying ? Icons.pause : Icons.play_circle),
        ))
      ],
    );
  }
}
