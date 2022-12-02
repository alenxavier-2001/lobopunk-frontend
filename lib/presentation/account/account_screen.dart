import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/k_m_b_converter.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';
import 'package:lobopunk/infrastructure/file_picker_impl/file_picker_impl.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/presentation/account/widgets/edit_account.dart';

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
              child: Stack(
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
                                imageUrl: "$kBaseurl${usedata.profileimage}",
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
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
                        height: height / 2,
                        width: width,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
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
                              Text(
                                "${usedata.name}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(fontSize: width / 13),
                              ),
                              SizedBox(
                                height: height / 90,
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
                                      background: Colors.grey.shade700,
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
                                      background: Colors.grey.shade700,
                                      text: "Connect",
                                      onpress: () {
                                        showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(25.0),
                                              ),
                                            ),
                                            builder: ((context) {
                                              return SocialLinkAddWidget(
                                                  height: height, width: width);
                                            }));
                                      },
                                    ),
                                  ),
                                ],
                              ),
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
            );
          }
        },
      ),
    );
  }
}

class SocialLinkAddWidget extends StatefulWidget {
  const SocialLinkAddWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  State<SocialLinkAddWidget> createState() => _SocialLinkAddWidgetState();
}

class _SocialLinkAddWidgetState extends State<SocialLinkAddWidget> {
  TextEditingController instagramController = TextEditingController();

  TextEditingController githubController = TextEditingController();

  TextEditingController twitterController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController youtubeController = TextEditingController();

  bool isUserNameTaken = false;
  bool isUserNameAvailable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    instagramController.dispose();
    githubController.dispose();
    twitterController.dispose();
    emailController.dispose();
    youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text("Error Occur"),
          );
        } else {
          UserModel usedata = state.userDetails;
          return SizedBox(
            height: height / 1.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const MySizedBox70(),
                  const MySizedBox70(),
                  Text(
                    "Add your social connections",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: width / 20),
                  ),
                  Text(
                    "help to connect anywhere",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: width / 25, color: Colors.grey),
                  ),
                  const MySizedBox70(),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  // const MySizedBox70(),
                  SizedBox(
                    height: height / 14,
                    child: SocailLinkSubWidget(
                        text: (usedata.socailmedialinks![0] == "")
                            ? "instagram"
                            : usedata.socailmedialinks![0],
                        image: "assets/instagram.png",
                        instagramController: instagramController),
                  ),
                  SizedBox(
                    height: height / 14,
                    child: SocailLinkSubWidget(
                        text: (usedata.socailmedialinks![1] == "")
                            ? "Youtube"
                            : usedata.socailmedialinks![1],
                        image: "assets/youtube.png",
                        instagramController: instagramController),
                  ),
                  SizedBox(
                    height: height / 14,
                    child: SocailLinkSubWidget(
                        text: (usedata.socailmedialinks![2] == "")
                            ? "Twitter"
                            : usedata.socailmedialinks![2],
                        image: "assets/twitter.png",
                        instagramController: instagramController),
                  ),
                  SizedBox(
                    height: height / 14,
                    child: SocailLinkSubWidget(
                        text: (usedata.socailmedialinks![3] == "")
                            ? "Github"
                            : usedata.socailmedialinks![3],
                        image: "assets/github.png",
                        instagramController: instagramController),
                  ),
                  // SizedBox(
                  //   height: height / 15,
                  //   child: SocailLinkSubWidget(
                  //       text: "instagram",
                  //       image: "assets/instagram.png",
                  //       instagramController: instagramController),
                  // ),
                  const MySizedBox70(),
                  SizedBox(
                    width: width / 2,
                    height: height / 15,
                    child: CurvedElevatedButton(
                        text: "Save",
                        background: appColor,
                        onpress: () async {
                          String insta = (usedata.socailmedialinks![0] !=
                                      instagramController.text.toString() &&
                                  instagramController.text.toString() != "")
                              ? instagramController.text.toString()
                              : usedata.socailmedialinks![0];
                          String youtube = (usedata.socailmedialinks![1] !=
                                      youtubeController.text.toString() &&
                                  youtubeController.text.toString() != "")
                              ? youtubeController.text.toString()
                              : usedata.socailmedialinks![1];
                          String twitter = (usedata.socailmedialinks![2] !=
                                      twitterController.text.toString() &&
                                  twitterController.text.toString() != "")
                              ? twitterController.text.toString()
                              : usedata.socailmedialinks![2];
                          String github = (usedata.socailmedialinks![3] !=
                                      githubController.text.toString() &&
                                  githubController.text.toString() != "")
                              ? githubController.text.toString()
                              : usedata.socailmedialinks![3];
                          Map<String, dynamic> data = {
                            "list": [insta, youtube, twitter, github]
                          };
                          BlocProvider.of<AccountBloc>(context)
                              .add(EditProfile(data: data));

                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class SocailLinkSubWidget extends StatelessWidget {
  const SocailLinkSubWidget({
    Key? key,
    required this.instagramController,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text;
  final String image;
  final TextEditingController instagramController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: width / 8,
            height: height / 9,
          ),
          SizedBox(
            width: width / 100,
          ),
          SizedBox(
            width: width / 1.25,
            height: height / 18,
            child: TextFormField(
              controller: instagramController,
              decoration: InputDecoration(
                hintText: text,
                // (usedata.bio == "" || usedata.bio == null)
                //     ? "Bio....."
                //     : usedata.bio,
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountCountSection extends StatelessWidget {
  const AccountCountSection({
    Key? key,
    required this.count,
    required this.text,
  }) : super(key: key);

  final int count;
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          kmbgenerator(count),
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: width / 17),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: width / 22,
              color: Colors.grey,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
