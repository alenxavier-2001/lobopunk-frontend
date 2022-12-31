import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/hashtag_screen/hashtagscreen_bloc.dart';
import 'package:lobopunk/application/publicpage/publicpage_bloc.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/core/contasts.dart';

import 'package:lobopunk/domain/core/debounce/debounce.dart';
import 'package:lobopunk/domain/exporepage/explore_page_model/result.dart';
import 'package:lobopunk/domain/hashtags/hastag_model/hastag_model.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/presentation/publicpage/widgets/explore_section.dart';
import 'package:lobopunk/presentation/publicpage/widgets/public_post_widget.dart';
import 'package:lobopunk/presentation/publicpage/widgets/publicpost_gird_view.dart';
import 'package:lobopunk/widgets/curved_elevated_button.dart';
import 'package:lobopunk/widgets/custom_loader.dart';

ValueNotifier<int> hashtagindex = ValueNotifier(0);

class PublicScreen extends StatelessWidget {
  PublicScreen({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<PublicpageBloc>(context).add(const LoadPublicPage());
    });

    return Scaffold(
      body: BlocBuilder<PublicpageBloc, PublicpageState>(
          builder: (context, state) {
        if (state.isLoading) {
          return const CustomLoader();
        } else if (state.hasError) {
          return const Center(
            child: Text("Error Occur"),
          );
        } else {
          BlocProvider.of<PublicpageBloc>(context)
              .add(const LoadExploreSection());
          return SafeArea(
              child: Padding(
            padding: EdgeInsets.all(width / 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoSearchTextField(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: const Icon(
                      CupertinoIcons.search,
                      color: Colors.grey,
                    ),
                    suffixIcon: const Icon(
                      CupertinoIcons.xmark_circle_fill,
                      color: Colors.grey,
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        return;
                      }
                      _debouncer.run(() {
                        BlocProvider.of<PublicpageBloc>(context)
                            .add(SearchEvent(data: value));
                      });
                    },
                  ),

                  SizedBox(
                    height: height / 18,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.hashtagList.length,
                        itemBuilder: (context, index) {
                          HashtagModel hashtag = state.hashtagList[index];
                          return InkWell(
                            onTap: () {
                              hashtagindex.value = index;
                              if (index != 0) {
                                BlocProvider.of<HashtagscreenBloc>(context).add(
                                    LoadHashtagPosts(
                                        hashtag.hashtag.toString()));
                              }
                            },
                            child: ValueListenableBuilder(
                                valueListenable: hashtagindex,
                                builder: (context, value, _) {
                                  return Container(
                                      padding: EdgeInsets.all(width / 80),
                                      margin: EdgeInsets.all(width / 160),
                                      height: height / 25,
                                      decoration: BoxDecoration(
                                          color: (index == hashtagindex.value)
                                              ? appColor
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        "  ${hashtag.hashtag}  ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
                                      )));
                                }),
                          );
                        }),
                  ),
                  const ExploreSectionWidget(),

                  // BlocBuilder<PublicpageBloc, PublicpageState>(
                  //   builder: (context, state) {
                  //     if (state.isLoading) {
                  //       return const CustomLoader();
                  //     } else if (state.hasError) {
                  //       return const Center(
                  //         child: Text("Error Occur"),
                  //       );
                  //     } else {
                  //       final userlist = state.searchList;
                  //       //return Container();
                  //       return ListView.builder(
                  //           shrinkWrap: true,
                  //           itemCount: userlist.length,
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           itemBuilder: (BuildContext context, index) {
                  //             UserModel user = userlist[index];
                  //             return (user.id == constusermodel.value.id)
                  //                 ? Container()
                  //                 : Padding(
                  //                     padding: EdgeInsets.only(
                  //                         top: width / 30,
                  //                         left: width / 60,
                  //                         right: width / 60),
                  //                     child: Row(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.center,
                  //                       children: [
                  //                         SizedBox(
                  //                           width: width / 25,
                  //                         ),
                  //                         CircleAvatar(
                  //                           radius: width / 13,
                  //                           backgroundColor: Colors.grey,
                  //                           backgroundImage: (user.profileimage !=
                  //                                       "" ||
                  //                                   user.profileimage != null)
                  //                               ? NetworkImage(
                  //                                   "$kBaseurl${user.profileimage}")
                  //                               : null,
                  //                         ),
                  //                         SizedBox(
                  //                           width: width / 20,
                  //                         ),
                  //                         Text(
                  //                           "${user.username}",
                  //                           style: TextStyle(
                  //                               fontSize: width / 21,
                  //                               color: Colors.white),
                  //                         ),
                  //                         const Spacer(),
                  //                         SizedBox(
                  //                           width: width / 4,
                  //                           height: height / 22,
                  //                           child: ValueListenableBuilder(
                  //                             valueListenable: constusermodel,
                  //                             builder: (context,
                  //                                 UserModel currentuser, _) {
                  //                               return CurvedElevatedButton(
                  //                                   text: (currentuser.punking!
                  //                                           .contains(user.id))
                  //                                       ? "Punked"
                  //                                       : "Punk",
                  //                                   background: (currentuser
                  //                                           .punking!
                  //                                           .contains(user.id))
                  //                                       ? Colors.grey
                  //                                       : appColor,
                  //                                   onpress: () {
                  //                                     UserImplementation().punkUser(
                  //                                         user.id.toString());
                  //                                   });
                  //                             },
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           width: width / 22,
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   );
                  //           });
                  //     }
                  //   },
                  // )
                ],
              ),
            ),
          ));
        }
      }),
    );
  }
}
