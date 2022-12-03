import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/presentation/account/widgets/social_link_subwidget.dart';
import 'package:lobopunk/widgets/curved_elevated_button.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

class SocialLinkAddWidget extends StatefulWidget {
  const SocialLinkAddWidget({
    Key? key,
  }) : super(key: key);

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
          return SingleChildScrollView(
            child: SizedBox(
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
                          instagramController: youtubeController),
                    ),
                    SizedBox(
                      height: height / 14,
                      child: SocailLinkSubWidget(
                          text: (usedata.socailmedialinks![2] == "")
                              ? "Twitter"
                              : usedata.socailmedialinks![2],
                          image: "assets/twitter.png",
                          instagramController: twitterController),
                    ),
                    SizedBox(
                      height: height / 14,
                      child: SocailLinkSubWidget(
                          text: (usedata.socailmedialinks![3] == "")
                              ? "Github"
                              : usedata.socailmedialinks![3],
                          image: "assets/github.png",
                          instagramController: githubController),
                    ),
                    SizedBox(
                      height: height / 14,
                      child: SocailLinkSubWidget(
                          text: (usedata.socailmedialinks![4] == "")
                              ? "Email"
                              : usedata.socailmedialinks![4],
                          image: "assets/email.png",
                          instagramController: emailController),
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

                            String email = (usedata.socailmedialinks![4] !=
                                        emailController.text.toString() &&
                                    emailController.text.toString() != "")
                                ? emailController.text.toString()
                                : usedata.socailmedialinks![4];
                            Map<String, dynamic> data = {
                              "a": insta,
                              "b": youtube,
                              "c": twitter,
                              "d": github,
                              "e": email
                            };
                            BlocProvider.of<AccountBloc>(context)
                                .add(EditSocialLink(data: data));

                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
