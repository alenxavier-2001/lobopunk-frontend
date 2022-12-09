import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/k_m_b_converter.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';
import 'package:lobopunk/infrastructure/file_picker_impl/file_picker_impl.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/presentation/account/widgets/account_count_section.dart';
import 'package:lobopunk/presentation/account/widgets/account_post_setion.dart';
import 'package:lobopunk/presentation/account/widgets/edit_account.dart';
import 'package:lobopunk/presentation/account/widgets/social_link_add.dart';

import 'package:lobopunk/presentation/auth/signin/signin.dart';
import 'package:lobopunk/widgets/curved_elevated_button.dart';
import 'package:lobopunk/widgets/custom_loader.dart';
import 'package:lobopunk/widgets/custom_loading_animation.dart';
import 'package:lobopunk/widgets/mysizedbox.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';
import 'package:lobopunk/widgets/textformfieldcurved.dart';
import 'package:lottie/lottie.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account-screen';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AccountBloc>(context).add(const LoadUserData());
      Future.delayed(const Duration(seconds: 1), () {
        BlocProvider.of<AccountBloc>(context).add(const LoadUserPosts());
      });
    });

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      // ),
      body: BlocBuilder<AccountBloc, AccountState>(
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
                                            child: CustomLoadingAnimation()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
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
                                        child: CurvedElevatedButton(
                                          fontColor: Colors.white,
                                          background: Colors.black,
                                          text: "Edit profile",
                                          onpress: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const EditProfileScreen()));
                                          },
                                        ),
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
                                                  return const SocialLinkAddWidget();
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

                      // Center(
                      //   child: InkWell(
                      //     onTap: () async {
                      //       final res = await FilePickerImplementation().addImage();
                      //       res.fold((l) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //             const SnackBar(content: Text('some error')));
                      //       }, (File file) async {
                      //         BlocProvider.of<AccountBloc>(context)
                      //             .add(ChangeProfileImage(file: file));
                      //       });
                      //     },
                      //     child: CircleAvatar(
                      //       radius: width / 6,
                      //       backgroundColor: Colors.grey.shade200,
                      //       backgroundImage: (usedata.profileimage == "" ||
                      //               usedata.profileimage == null)
                      //           ? null
                      //           : NetworkImage("$kBaseurl${usedata.profileimage}"),
                      //     ),
                      //   ),
                      // ),
                      // Text(usedata.email.toString()),
                      // Text(usedata.id.toString()),
                      // Text(usedata.name.toString()),
                      // Text(usedata.username.toString()),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       final res = await AuthImplementation().signOut();
                      //       res.fold((l) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //             const SnackBar(content: Text('some error')));
                      //       }, (bool r) {
                      //         log("dchdc  dc");
                      //         Navigator.pushReplacementNamed(
                      //             context, SignInScreen.routeName);
                      //       });
                      //     },
                      //     child: const Text("Log out")),
                    ],
                  ),
                  const AccountPostSection(),
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
