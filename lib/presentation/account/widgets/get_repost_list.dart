import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/profile_view/profileview_bloc.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/k_m_b_converter.dart';
import 'package:lobopunk/core/usernamenotifer.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/post/post_impl.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/presentation/profile_view/profile_view_screen.dart';
import 'package:lobopunk/widgets/curved_elevated_button.dart';
import 'package:lobopunk/widgets/custom_loader.dart';
import 'package:lobopunk/widgets/custom_loading_animation.dart';

class GetRepostListWidget extends StatelessWidget {
  final String postid;
  const GetRepostListWidget({super.key, required this.postid});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: PostImplementation()
          .getrepostListStream(const Duration(microseconds: 10), postid),
      builder: (context, stream) {
        if (stream.connectionState == ConnectionState.done) {
          return const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 20,
          );
        }
        if (stream.hasData) {
          List<PostModel> postlist = stream.data!.results ?? [];
          return Padding(
            padding: EdgeInsets.all(width / 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Post splitted list",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700, fontSize: width / 19),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      //shrinkWrap: true,
                      itemCount: postlist.length,
                      //  physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        PostModel postdata = postlist[index];
                        return Padding(
                          padding: EdgeInsets.all(width / 50),
                          child: Row(
                            children: [
                              Container(
                                width: width / 5,
                                height: height / 9.5,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(9),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "$kBaseurl${postdata.thumbnailurl.toString()}",
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: width / 18,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProfileviewBloc>(context)
                                          .add(LoadProfileData(
                                              userid:
                                                  postdata.userid.toString()));

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfileViewScreen()));
                                    },
                                    child: ValueListenableBuilder(
                                        valueListenable: usernamlists,
                                        builder: (context,
                                            Map<String, dynamic> usernamelists,
                                            _) {
                                          (usernamelists
                                                  .containsKey(postdata.userid))
                                              ? null
                                              : UserImplementation()
                                                  .getUserName(
                                                      userid: postdata.userid
                                                          .toString());
                                          return Text(
                                            (usernamelists.containsKey(
                                                    postdata.userid))
                                                ? usernamelists[postdata.userid]
                                                : postdata.userid,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(fontSize: width / 20),
                                          );
                                        }),
                                  ),
                                  Text(
                                    "1987  Likes",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            fontSize: width / 22,
                                            fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    width: width / 2,
                                    child: CurvedElevatedButton(
                                        text: "Remove Split",
                                        background: Colors.red,
                                        fontColor: Colors.white,
                                        onpress: () {
                                          Map<String, dynamic> data = {
                                            "postid": postid,
                                            "repostid": postdata.id,
                                          };
                                          PostImplementation()
                                              .rePostDelete(data);
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(child: CustomLoader());
        }
      },
    );
  }
}
