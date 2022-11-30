import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/addpost/addpost_impl.dart';
import 'package:lobopunk/presentation/addpost/addpost.dart';
import 'package:http/http.dart' as http;
import 'package:lobopunk/widgets/like_animation.dart';
import 'package:lobopunk/widgets/post_bottom_widget.dart';
import 'package:lobopunk/widgets/post_side_bar.dart';
import 'package:lobopunk/widgets/video_tile_widget.dart';

List videoslist = [
  /*'https://player.vimeo.com/external/530280164.sd.mp4?s=45dc172418894ec2e2c0ab0ecf01b5eb1e1482ae&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/585288070.sd.mp4?s=055e233a356714c3b3f0eb61ef587cbb7a04f510&profile_id=164&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/527808435.sd.mp4?s=f9278972191c2be3cf49e1b7adc059fbe5f3aad3&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/progressive_redirect/playback/716706676/rendition/360p/file.mp4?loc=external&oauth2_token_id=57447761&signature=b9b1fc5b6e678e6bc37de5db67536760c1719fd6685df75c7f0ecb3f10f8b9cd',
  'https://player.vimeo.com/external/592772055.sd.mp4?s=5c5c134f640596bc0d2030ffc216c2d6c7822770&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/progressive_redirect/playback/759728209/rendition/720p/file.mp4?loc=external&oauth2_token_id=57447761&signature=96906cf6eeab2ff514ee1f9495d124a7e069b3ce24dea5ac155cc947ec1d8e13',
  'https://player.vimeo.com/external/546448320.sd.mp4?s=d3f7535e8d8361d204c5801d9176886bd4a79574&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/progressive_redirect/playback/694124248/rendition/360p?loc=external&oauth2_token_id=57447761&signature=1563b3933cb900218850d211ea9f8a88eb0ccd40c50ee18e5b512db65f91aee7',
  'https://player.vimeo.com/progressive_redirect/playback/749766982/rendition/540p/file.mp4?loc=external&oauth2_token_id=57447761&signature=48791a3ff7e72f293a80610e1f2cc601c49fc0146b259e3b608c1794d8d1f46b'
*/
];
ValueNotifier<int> snappedindexhome = ValueNotifier(0);

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Following"),
              SizedBox(
                width: width / 4,
              ),
              Text("Home"),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      /*  body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                // final res = await AddPostImplementation().addPostVideo();
                // res.fold((l) {
                //   log("Some error");
                // }, (File file) {
                //   log(file.path);
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => AddPostScreen(file: file)));
                // });
              },
              child: const Text("Add post"))
        ],
      ),*/

      body: PageView.builder(
          onPageChanged: (int page) {
            snappedindexhome.value = page;
          },
          scrollDirection: Axis.vertical,
          itemCount: videoslist.length,
          itemBuilder: (context, index) {
            return PostWidget(
              index: index,
            );
          }),
    );
  }
}

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLikeAnimating = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: snappedindexhome,
        builder: (context, int snapindex, _) {
          return GestureDetector(
            onDoubleTap: () {
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Stack(alignment: Alignment.bottomCenter, children: [
                  VideoTileWidget(
                    url: videoslist[widget.index],
                    currentIndex: widget.index,
                    snappedPageIndex: snapindex,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: height / 2,
                          child: PostBottomWidget(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: height / 1.75,
                          child: PostSideBar(
                            likeButtonWidget: LikeAnimation(
                              smallLike: true,
                              isAnimating: true,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.heart_broken,
                                    size: 40,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: isLikeAnimating ? .8 : 0,
                  child: LikeAnimation(
                    child: Icon(Icons.favorite_sharp,
                        color: Colors.white, size: 100),
                    isAnimating: isLikeAnimating,
                    duration: Duration(milliseconds: 100),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}

class AddPostVideo {
  File file = File("");
  final ImagePicker picker = ImagePicker();

  Future<File> getVideo() async {
    final XFile? image = await picker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(minutes: 1));
    file = File(image!.path);

    if (image.path.isEmpty) getLostData();

    return file;
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      file = File(response.file!.path);
    } else {
      if (kDebugMode) {
        print(response.file);
      }
    }
  }
}
