import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/k_m_b_converter.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/post/post_impl.dart';
import 'package:lobopunk/presentation/account/widgets/get_repost_list.dart';
import 'package:lobopunk/presentation/account/widgets/post_edit_section.dart';
import 'package:lobopunk/presentation/account/widgets/post_prev_edit.dart';
import 'package:lobopunk/widgets/curved_elevated_button.dart';

import 'package:lobopunk/widgets/mysizedbox.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';
import 'package:share_plus/share_plus.dart';

String imgurl1 =
    "https://media.zigcdn.com/media/content/2022/May/179348629-210414-01_002-1200x493_720x540.jpg";

List reportList = [
  "I Just don't like it",
  "It's spam",
  "Nudity or Sexual activity",
  "Hate speech or symbols",
  "False information",
  "Bullying or Harassment",
  "Scam or Fraud",
  "Violence or dangerous organization",
  "Intellectual property violation",
  "Sale of illegal goods",
  "Eating disorder",
  "Something else"
];

class PostSideBar extends StatelessWidget {
  final Widget likeButtonWidget;
  final int index;
  final bool ispost2;
  const PostSideBar({
    super.key,
    required this.likeButtonWidget,
    required this.index,
    required this.ispost2,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ValueListenableBuilder(
            valueListenable: postListNotifier,
            builder: (context, List<PostModel> postlist, _) {
              PostModel postdata = postlist[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: ((context) {
                              return SizedBox(
                                height:
                                    (constusermodel.value.id == postdata.userid)
                                        ? height / 4.2
                                        : height / 5.5,
                                child: Column(
                                  children: [
                                    const MySizedBox70(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MoreOptionIconWidget(
                                          postindex: index,
                                          icon: Icons.share,
                                          text: "Share",
                                          postdata: postdata,
                                        ),
                                        MoreOptionIconWidget(
                                          postindex: index,
                                          icon: Icons.download,
                                          text: "Download",
                                          postdata: postdata,
                                        ),
                                        (constusermodel.value.id ==
                                                postdata.userid)
                                            ? MoreOptionIconWidget(
                                                postindex: index,
                                                icon: Icons.edit,
                                                text: "Edit",
                                                postdata: postdata,
                                              )
                                            : MoreOptionIconWidget(
                                                postindex: index,
                                                icon: Icons.report,
                                                text: "Report",
                                                postdata: postdata,
                                              ),
                                      ],
                                    ),
                                    (constusermodel.value.id == postdata.userid)
                                        ? const MySizedBox70()
                                        : Container(),
                                    (constusermodel.value.id == postdata.userid)
                                        ? InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              showModalBottomSheet(
                                                  context: context,
                                                  backgroundColor: Theme.of(
                                                          context)
                                                      .scaffoldBackgroundColor,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(25.0),
                                                    ),
                                                  ),
                                                  builder: ((context) {
                                                    return SizedBox(
                                                      height: height / 1.5,
                                                      child:
                                                          GetRepostListWidget(
                                                        postid: postdata.id
                                                            .toString(),
                                                      ),
                                                    );
                                                  }));
                                            },
                                            child: Text(
                                              "Split list",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: width / 20,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          )
                                        : Container(),
                                    (constusermodel.value.id == postdata.userid)
                                        ? const MySizedBox70()
                                        : Container(),
                                    (constusermodel.value.id == postdata.userid)
                                        ? InkWell(
                                            onTap: () {},
                                            child: Text(
                                              "Delete",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: width / 20,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              );
                            }));
                      },
                      icon: Icon(
                        Icons.more_vert_outlined,
                        size: width / 11,
                        color: Colors.white,
                      )),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      DateTime now = DateTime.now();
                      (constusermodel.value.id == postdata.userid)
                          ? null
                          : showModalBottomSheet(
                              context: context,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              builder: ((context) {
                                return SizedBox(
                                  height: height / 4,
                                  child: Padding(
                                    padding: EdgeInsets.all(width / 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const MySizedBox70(),
                                        Center(
                                          child: Text(
                                            "Split the post",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: width / 18),
                                          ),
                                        ),
                                        const MySizedBox70(),
                                        SizedBox(
                                          height: height / 25,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "You want request for spliting this post",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                              Text(
                                                "Learn more ..",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const MySizedBox(),
                                        Center(
                                          child: SizedBox(
                                            width: width / 1.1,
                                            child: CurvedElevatedButton(
                                                text: "Request",
                                                background: appColor,
                                                onpress: () async {
                                                  Map<String, dynamic> data = {
                                                    "postid": postdata.id,
                                                    "time":
                                                        now.toUtc().toString()
                                                  };
                                                  final res =
                                                      await PostImplementation()
                                                          .rePostRequest(data);
                                                  res.fold((MainFailure error) {
                                                    error.whenOrNull(
                                                        clientFailure:
                                                            (String err) {
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                            content: Text(err)),
                                                      );
                                                    }, serverFailure:
                                                            (ServerErrorModel
                                                                err) {
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                            content: Text(err
                                                                .msg
                                                                .toString())),
                                                      );
                                                    });
                                                  }, (r) {
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                          content: Text(
                                                              'Successfully request sended')),
                                                    );
                                                  });
                                                }),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }));
                    },
                    child: Icon(
                      Icons.monetization_on_outlined,
                      size: width / 11,
                      color: Colors.white,
                    ),
                  ),
                  const MySizedBox70(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      likeButtonWidget,
                      Text(
                        kmbgenerator(postdata.like!.length),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: width / 20),
                      ),
                    ],
                  ),
                  const MySizedBox70(),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if ((postdata.dislike!
                              .contains(constusermodel.value.id))) {
                          } else {
                            PostImplementation().dislikePost(
                                postdata.id.toString(), index, ispost2);
                          }
                        },
                        child: Icon(
                          (postdata.dislike!.contains(constusermodel.value.id))
                              ? Icons.heart_broken_rounded
                              : Icons.heart_broken_outlined,
                          size: width / 11,
                          color: (postdata.dislike!
                                  .contains(constusermodel.value.id))
                              ? Colors.redAccent
                              : Colors.white,
                        ),
                      ),
                      Text(
                        kmbgenerator(postdata.dislike!.length),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: width / 20),
                      ),
                    ],
                  ),
                  const MySizedBox70(),
                  InkWell(
                    onTap: () async {
                      final url = await PostImplementation()
                          .postShare(postdata.id.toString());
                      Share.share(url, subject: '');
                    },
                    child: Transform.rotate(
                      angle: 180 * math.pi / 100,
                      child: Icon(
                        Icons.send_outlined,
                        size: width / 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const MySizedBox(),
                  // const MySizedBox(),
                  const MySizedBox(),
                ],
              );
            }),
      ],
    );
  }
}

class MoreOptionIconWidget extends StatelessWidget {
  const MoreOptionIconWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.postdata,
    required this.postindex,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final PostModel postdata;
  final int postindex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        if (text == "Report") {
          Navigator.pop(context);
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              builder: ((context) {
                return SizedBox(
                    height: height / 1.2,
                    child: Padding(
                      padding: EdgeInsets.all(width / 60),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const MySizedBox70(),
                            Center(
                              child: Text(
                                "Report",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(fontSize: width / 19),
                              ),
                            ),
                            const MySizedBox70(),
                            Text(
                              "Why are you reporting this post?",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(fontSize: width / 21),
                            ),
                            const MySizedBox70(),
                            Text(
                              "Your report is anonymous, except if you're reporting an intellectual property infringe. If someone is in immediate danger. report this emergency service - don't wait",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: width / 27),
                            ),
                            const MySizedBox70(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    List.generate(reportList.length, (index) {
                                  return InkWell(
                                    onTap: () async {
                                      DateTime now = DateTime.now();

                                      Map<String, dynamic> data = {
                                        "userid":
                                            constusermodel.value.id.toString(),
                                        "postid": postdata.id,
                                        "message": reportList[index],
                                        "time": now.toUtc().toString(),
                                      };
                                      PostImplementation()
                                          .reportPost(data, postindex);
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(width / 50),
                                      child: Text(
                                        reportList[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(fontSize: width / 21),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            )
                          ]),
                    ));
              }));
        }
        if (text == "Edit") {
          Navigator.pop(context);
          showModalBottomSheet(
              context: context,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              builder: ((context) {
                return SizedBox(
                  height: height / 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              builder: ((context) {
                                return PostDesEditingSection(
                                  postdata: postdata,
                                );
                              }));
                        },
                        child: Text(
                          "Edit description",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: width / 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostPrevEdit(
                                        postdata: postdata,
                                      )));
                        },
                        child: Text(
                          "Add previous post",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: width / 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                );
              }));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: width / 6.5,
            height: height / 13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: (text == "Report") ? Colors.red : Colors.white,
                    width: width / 90)),
            child: Icon(
              icon,
              size: width / 15,
              color: (text == "Report") ? Colors.red : Colors.white,
            ),
          ),
          const MySizedBox70(),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: width / 20,
                ),
          ),
        ],
      ),
    );
  }
}

class AnimatedRoundWidget extends StatefulWidget {
  const AnimatedRoundWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedRoundWidget> createState() => _AnimatedRoundWidgetState();
}

class _AnimatedRoundWidgetState extends State<AnimatedRoundWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Stack(alignment: Alignment.center, children: [
        const SizedBox(
          height: 50,
          width: 50,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 50,
          ),
        ),
        CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(imgurl1),
        )
      ]),
      builder: (context, child) {
        return Transform.rotate(
          angle: 2 * math.pi * _animationController.value,
          child: child,
        );
      },
    );
  }
}
