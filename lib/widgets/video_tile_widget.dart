import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lobopunk/widgets/post_side_bar.dart';
import 'package:video_player/video_player.dart';

class VideoTileWidget extends StatefulWidget {
  final int snappedPageIndex;
  final int currentIndex;
  final String url;
  const VideoTileWidget(
      {super.key,
      required this.url,
      required this.snappedPageIndex,
      required this.currentIndex});

  @override
  State<VideoTileWidget> createState() => _VideoTileWidgetState();
}

class _VideoTileWidgetState extends State<VideoTileWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future _initializeVideoplayer;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _initializeVideoplayer = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    (widget.currentIndex == widget.snappedPageIndex &&
            _videoPlayerController.value.isPlaying)
        ? _videoPlayerController.play()
        : _videoPlayerController.pause();
    return FutureBuilder(
      future: _initializeVideoplayer,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              (_videoPlayerController.value.size.height > height / 1.1)
                  ? VideoPlayer(_videoPlayerController)
                  : Center(
                      child: AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController)),
                    ),
              GestureDetector(
                onTap: () {
                  _videoPlayerController.value.isPlaying
                      ? _videoPlayerController.pause()
                      : _videoPlayerController.play();
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      EdgeInsets.only(right: width / 50, bottom: width / 30),
                  child: CircleAvatar(
                    radius: width / 20,
                    backgroundColor: Colors.black,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            (_videoPlayerController.value.volume == 0)
                                ? _videoPlayerController.setVolume(1)
                                : _videoPlayerController.setVolume(0);
                          });
                        },
                        icon: Center(
                          child: Icon(
                            (_videoPlayerController.value.volume == 0)
                                ? Icons.music_off
                                : Icons.music_note_sharp,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container(
            color: Colors.transparent,
            child: const Center(child: AnimatedRoundWidget()),
          );
        }
      }),
    );
  }
}
