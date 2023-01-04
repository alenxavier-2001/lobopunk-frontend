import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lobopunk/application/profile_view/profileview_bloc.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/presentation/account/widgets/account_count_section.dart';
import 'package:lobopunk/presentation/account/widgets/edit_account.dart';
import 'package:lobopunk/presentation/profile_view/widgets/profile_post_setion.dart';
import 'package:lobopunk/widgets/curved_elevated_button.dart';
import 'package:lobopunk/widgets/custom_loader.dart';
import 'package:lobopunk/widgets/custom_loading_animation.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<ProfileviewBloc, ProfileviewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const CustomLoader();
          } else if (state.hasError) {
            return const Center(
              child: Text("Error Occur"),
            );
          } else {
            UserModel usedata = state.userDetails;

            return Padding(
              padding: EdgeInsets.all(width / 80),
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: height / 2.5,
                                width: width,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  // image: (usedata.profileimage == "" ||
                                  //         usedata.profileimage == null)
                                  //     ? null
                                  //     : DecorationImage(
                                  //         image: NetworkImage(
                                  //             "$kBaseurl${usedata.profileimage}"),
                                  //         fit: BoxFit.cover,
                                  //       ),
                                ),
                                child: (usedata.profileimage == "" ||
                                        usedata.profileimage == null)
                                    ? const Icon(Icons.account_box_rounded)
                                    : CachedNetworkImage(
                                        imageUrl:
                                            "$kBaseurl${usedata.profileimage}",
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            const Center(
                                                child:
                                                    CustomLoadingAnimation()),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: width / 13,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: height / 2.6,
                          ),
                          Container(
                            height: height / 3,
                            width: width,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                )),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: width / 15,
                                  left: width / 15,
                                  right: width / 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${usedata.name}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(fontSize: width / 15),
                                      ),
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      (usedata.isverified == true)
                                          ? Image.asset(
                                              'assets/bluetick.png',
                                              width: width / 15,
                                              height: height / 15,
                                            )
                                          : Container(),
                                    ],
                                  ),
                                  Text(
                                    "@${usedata.username}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            fontSize: width / 23,
                                            color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height / 90,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${usedata.bio}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: width / 24,
                                              color: Colors.white),
                                      maxLines: 7,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AccountCountSection(
                                        text: "Posts",
                                        count: (usedata.myposts == [] ||
                                                usedata.myposts == null)
                                            ? 0
                                            : usedata.myposts!.length,
                                      ),
                                      AccountCountSection(
                                        text: "Punkers",
                                        count: (usedata.punkers == [] ||
                                                usedata.punkers == null)
                                            ? 0
                                            : usedata.punkers!.length,
                                      ),
                                      AccountCountSection(
                                        text: "Likes",
                                        count: (usedata.likedposts == null)
                                            ? 0
                                            : int.parse(
                                                usedata.totallikes.toString()),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width / 2.6,
                                        child: ValueListenableBuilder(
                                            valueListenable: constusermodel,
                                            builder: (context,
                                                UserModel currentuserdata, _) {
                                              return CurvedElevatedButton(
                                                fontColor: Colors.white,
                                                background: (currentuserdata
                                                        .punking!
                                                        .contains(usedata.id
                                                            .toString()))
                                                    ? Colors.black
                                                    : appColor,
                                                text: (currentuserdata.punking!
                                                        .contains(usedata.id
                                                            .toString()))
                                                    ? "Punked"
                                                    : "Punk",
                                                onpress: () {
                                                  UserImplementation().punkUser(
                                                      usedata.id.toString());
                                                },
                                              );
                                            }),
                                      ),
                                      SizedBox(
                                        width: width / 2.6,
                                        child: CurvedElevatedButton(
                                          fontColor: Colors.white,
                                          background: Colors.black,
                                          text: "Connect",
                                          onpress: () {
                                            showModalBottomSheet(
                                                context: context,
                                                backgroundColor: Theme.of(
                                                        context)
                                                    .scaffoldBackgroundColor,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(25.0),
                                                  ),
                                                ),
                                                builder: ((context) {
                                                  return SizedBox(
                                                    height: height / 7,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        (usedata.socailmedialinks![
                                                                    0] ==
                                                                "")
                                                            ? Container()
                                                            : Image.asset(
                                                                "assets/instagram.png",
                                                                width:
                                                                    width / 7,
                                                                height:
                                                                    height / 8,
                                                              ),
                                                        (usedata.socailmedialinks![
                                                                    1] ==
                                                                "")
                                                            ? Container()
                                                            : Image.asset(
                                                                "assets/youtube.png",
                                                                width:
                                                                    width / 7,
                                                                height:
                                                                    height / 8,
                                                              ),
                                                        (usedata.socailmedialinks![
                                                                    2] ==
                                                                "")
                                                            ? Container()
                                                            : Image.asset(
                                                                "assets/twitter.png",
                                                                width:
                                                                    width / 7,
                                                                height:
                                                                    height / 8,
                                                              ),
                                                        (usedata.socailmedialinks![
                                                                    3] ==
                                                                "")
                                                            ? Container()
                                                            : Image.asset(
                                                                "assets/github.png",
                                                                width:
                                                                    width / 7,
                                                                height:
                                                                    height / 8,
                                                              ),
                                                        (usedata.socailmedialinks![
                                                                    4] ==
                                                                "")
                                                            ? Container()
                                                            : Image.asset(
                                                                "assets/email.png",
                                                                width:
                                                                    width / 7,
                                                                height:
                                                                    height / 8,
                                                              ),
                                                      ],
                                                    ),
                                                  );
                                                }));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const MySizedBox70(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const ProfileViewPostSection(),
                  const MySizedBox70(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
