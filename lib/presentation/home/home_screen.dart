import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/home/home_bloc.dart';
import 'package:lobopunk/core/common_notifer.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/common_impl/common_impl.dart';
import 'package:lobopunk/widgets/custom_loader.dart';

import 'package:lobopunk/widgets/post_widget.dart';

ValueNotifier<int> snappedindexhome = ValueNotifier(0);
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;

              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }

              return true;
            },
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: (scrollNotifier.value)
                  ? AppBar(
                      automaticallyImplyLeading: false,
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Lobo",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontSize: width / 17),
                                ),
                                Text(
                                  "Punk",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontSize: width / 17),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0),
                                      ),
                                    ),
                                    builder: ((context) {
                                      return SizedBox(
                                        height: height / 5,
                                        child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: qualityList.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  CommonImplementation()
                                                      .changeQuality(
                                                          qualityList[index]);
                                                  Navigator.pop(context);
                                                },
                                                child: SizedBox(
                                                  height: height / 16,
                                                  child: Center(
                                                    child: Text(
                                                      qualityList[index],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium!
                                                          .copyWith(
                                                              fontSize:
                                                                  width / 20),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      );
                                    }));
                              },
                              child: Container(
                                width: width / 4.8,
                                height: height / 23,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: ValueListenableBuilder(
                                      valueListenable: qualityNotifier,
                                      builder: (context, String quality, _) {
                                        return Text(
                                          quality,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: width / 24),
                                        );
                                      }),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width / 14,
                            )
                          ],
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    )
                  : null,
              body: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const CustomLoader();
                  } else if (state.hasError) {
                    return const Center(
                      child: Text("Error Occur"),
                    );
                  } else {
                    List<PostModel> homeposts = state.homeposts.results ?? [];
                    postListNotifier.value = homeposts;
                    return PageView.builder(
                        onPageChanged: (int page) {
                          snappedindexhome.value = page;
                        },
                        scrollDirection: Axis.vertical,
                        itemCount: homeposts.length,
                        itemBuilder: (context, index) {
                          return PostWidget(
                              index: index,
                              data: homeposts[index],
                              url: (qualityNotifier.value == "High")
                                  ? "${homeposts[index].highvideourl}"
                                  : (qualityNotifier.value == "Medium")
                                      ? "${homeposts[index].midvideourl}"
                                      : "${homeposts[index].lowvideourl}");
                        });
                    ;
                  }
                },
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

              //body: CustomLoader(),

              // body: PageView.builder(
              //     onPageChanged: (int page) {
              //       snappedindexhome.value = page;
              //     },
              //     scrollDirection: Axis.vertical,
              //     itemCount: videoslist.length,
              //     itemBuilder: (context, index) {
              //       return PostWidget(
              //         index: index,
              //       );
              //     }),
            ),
          );
        });
  }
}
