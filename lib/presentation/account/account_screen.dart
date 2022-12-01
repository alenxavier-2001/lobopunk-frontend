import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/k_m_b_converter.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';
import 'package:lobopunk/infrastructure/file_picker_impl/file_picker_impl.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';

import 'package:lobopunk/presentation/auth/signin/signin.dart';

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
            log("$kBaseurl${usedata.profileimage}");
            return Padding(
              padding: EdgeInsets.all(width / 80),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: height / 2.5,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: (usedata.profileimage == "" ||
                                  usedata.profileimage == null)
                              ? null
                              : DecorationImage(
                                  image: NetworkImage(
                                      "$kBaseurl${usedata.profileimage}"),
                                  fit: BoxFit.cover),
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
                                  "gvdchj bdk dhds hs ds s dh sdhsd hsd hsd sd d dshdv vshd hs dhsd hjsd sdlsd shdk sd sd   hj d ds  ceh ech csh ch chc eh s",
                                  maxLines: 5,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: width / 23,
                                          color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                              )
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
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: width / 20, color: Colors.grey),
        ),
      ],
    );
  }
}
