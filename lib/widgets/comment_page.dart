import 'dart:developer';
import 'dart:math' as math;

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/comment/comment_bloc.dart';
import 'package:lobopunk/core/basic_scafoldmsg.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/k_m_b_converter.dart';
import 'package:lobopunk/core/usernamenotifer.dart';
import 'package:lobopunk/domain/comment/comment_model/comment_model.dart';
import 'package:lobopunk/domain/comment/comment_model/subcomment.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/infrastructure/comments/comments_impl.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/widgets/custom_loader.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

ValueNotifier<Map<String, dynamic>> currentsub =
    ValueNotifier({"issub": false, "commentid": "", "commentindex": 0});

class CommentPageScreen extends StatefulWidget {
  final String postid;
  const CommentPageScreen({super.key, required this.postid});

  @override
  State<CommentPageScreen> createState() => _CommentPageScreenState();
}

class _CommentPageScreenState extends State<CommentPageScreen> {
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<CommentBloc>(context)
    //       .add(LoadComments(postid: widget.postid));
    // });
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Comments"),
      ),
      body: BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
        if (state.isLoading) {
          return const CustomLoader();
        } else if (state.hasError) {
          return const Center(
            child: Text("Error Occur"),
          );
        } else {
          List<CommentModel> commentlist = state.commentsList;
          return ListView.builder(
              itemCount: commentlist.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPress: (() {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Do you want delete comment'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                BlocProvider.of<CommentBloc>(context).add(
                                    DeleteComment(
                                        commentid:
                                            commentlist[index].id.toString(),
                                        index: index));
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }),
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: userimagelists,
                              builder: (context,
                                  Map<String, dynamic> userimagelists, _) {
                                (userimagelists.containsKey(
                                        commentlist[index].userid.toString()))
                                    ? null
                                    : UserImplementation().getUserName(
                                        userid: commentlist[index]
                                            .userid
                                            .toString());

                                return CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: (userimagelists.containsKey(
                                          commentlist[index].userid.toString()))
                                      ? NetworkImage(
                                          "$kBaseurl${userimagelists[commentlist[index].userid.toString()]}")
                                      : null,
                                  radius: width / 16,
                                );
                              }),
                          SizedBox(
                            width: width / 1.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ValueListenableBuilder(
                                    valueListenable: usernamlists,
                                    builder: (context,
                                        Map<String, dynamic> usernamelists, _) {
                                      (usernamelists.containsKey(
                                              commentlist[index]
                                                  .userid
                                                  .toString()))
                                          ? null
                                          : UserImplementation().getUserName(
                                              userid: commentlist[index]
                                                  .userid
                                                  .toString());
                                      return Text(
                                        (usernamelists.containsKey(
                                                commentlist[index]
                                                    .userid
                                                    .toString()))
                                            ? usernamelists[commentlist[index]
                                                .userid
                                                .toString()]
                                            : "data.userid",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(fontSize: width / 21),
                                      );
                                    }),
                                ExpandableText(
                                  "${commentlist[index].commenttext}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: width / 24),
                                  expandText: 'more',
                                  collapseText: 'less',
                                  expandOnTextTap: true,
                                  maxLines: 2,
                                  collapseOnTextTap: true,
                                  linkColor: Colors.grey,
                                ),
                                const MySizedBox70(),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<CommentBloc>(context).add(
                                      LikeComment(
                                          commentid:
                                              commentlist[index].id.toString(),
                                          index: index));
                                },
                                child: Icon(
                                  (commentlist[index]
                                          .like!
                                          .contains(constusermodel.id))
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_outlined,
                                  size: width / 20,
                                  color: (commentlist[index]
                                          .like!
                                          .contains(constusermodel.id))
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                              Text(
                                kmbgenerator(commentlist[index].like!.length),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: width / 30),
                              ),
                              Transform.rotate(
                                angle: 100 * math.pi / 100,
                                child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<CommentBloc>(context).add(
                                        DislikeComment(
                                            commentid: commentlist[index]
                                                .id
                                                .toString(),
                                            index: index));
                                  },
                                  child: Icon(
                                    (commentlist[index]
                                            .dislike!
                                            .contains(constusermodel.id))
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_outlined,
                                    size: width / 20,
                                    color: (commentlist[index]
                                            .dislike!
                                            .contains(constusermodel.id))
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                kmbgenerator(
                                    commentlist[index].dislike!.length),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: width / 30),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width / 14,
                          ),
                          Expanded(
                            child: ExpansionTile(
                              onExpansionChanged: ((value) {
                                currentsub.value = {
                                  "issub": value,
                                  "commentid": commentlist[index].id.toString(),
                                  "commentindex": index
                                };
                                log(value.toString());
                              }),
                              title: Text(
                                "Replies ${commentlist[index].subcomments!.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontSize: width / 24,
                                        color: Colors.blue),
                              ),
                              children: List.generate(
                                  commentlist[index].subcomments!.length,
                                  (subindex) {
                                Subcomment subcomment =
                                    commentlist[index].subcomments![subindex];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: width / 50,
                                  ),
                                  child: GestureDetector(
                                    onLongPress: () {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible:
                                            false, // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Do you want delete comment'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  BlocProvider.of<CommentBloc>(
                                                          context)
                                                      .add(DeleteSubComment(
                                                          commentid:
                                                              commentlist[index]
                                                                  .id
                                                                  .toString(),
                                                          index: index,
                                                          subindex: subindex));
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ValueListenableBuilder(
                                            valueListenable: userimagelists,
                                            builder: (context,
                                                Map<String, dynamic>
                                                    userimagelists,
                                                _) {
                                              (userimagelists.containsKey(
                                                      subcomment.userid
                                                          .toString()))
                                                  ? null
                                                  : UserImplementation()
                                                      .getUserName(
                                                          userid: subcomment
                                                              .userid
                                                              .toString());

                                              return CircleAvatar(
                                                backgroundColor: Colors.grey,
                                                backgroundImage: (userimagelists
                                                        .containsKey(subcomment
                                                            .userid
                                                            .toString()))
                                                    ? NetworkImage(
                                                        "$kBaseurl${userimagelists[subcomment.userid.toString()]}")
                                                    : null,
                                                radius: width / 20,
                                              );
                                            }),
                                        SizedBox(
                                          width: width / 1.65,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ValueListenableBuilder(
                                                  valueListenable: usernamlists,
                                                  builder: (context,
                                                      Map<String, dynamic>
                                                          usernamelists,
                                                      _) {
                                                    (usernamelists.containsKey(
                                                            subcomment.userid
                                                                .toString()))
                                                        ? null
                                                        : UserImplementation()
                                                            .getUserName(
                                                                userid: subcomment
                                                                    .userid
                                                                    .toString());
                                                    return Text(
                                                      (usernamelists.containsKey(
                                                              subcomment.userid
                                                                  .toString()))
                                                          ? usernamelists[
                                                              subcomment.userid
                                                                  .toString()]
                                                          : "data.userid",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium!
                                                          .copyWith(
                                                              fontSize:
                                                                  width / 24),
                                                    );
                                                  }),
                                              ExpandableText(
                                                "${subcomment.commenttext}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        fontSize: width / 26),
                                                expandText: 'more',
                                                collapseText: 'less',
                                                expandOnTextTap: true,
                                                maxLines: 2,
                                                collapseOnTextTap: true,
                                                linkColor: Colors.grey,
                                              ),
                                              const MySizedBox70(),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (subcomment.like!.contains(
                                                    constusermodel.id)) {
                                                } else {
                                                  BlocProvider.of<CommentBloc>(
                                                          context)
                                                      .add(LikeSubComment(
                                                          commentid:
                                                              commentlist[index]
                                                                  .id
                                                                  .toString(),
                                                          index: index,
                                                          subindex: subindex));
                                                }
                                              },
                                              child: Icon(
                                                (subcomment.like!.contains(
                                                        constusermodel.id))
                                                    ? Icons.favorite_rounded
                                                    : Icons
                                                        .favorite_border_outlined,
                                                size: width / 20,
                                                color: (subcomment.like!
                                                        .contains(
                                                            constusermodel.id))
                                                    ? Colors.red
                                                    : Colors.white,
                                              ),
                                            ),
                                            Text(
                                              kmbgenerator(
                                                  subcomment.like!.length),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: width / 30),
                                            ),
                                            Transform.rotate(
                                              angle: 100 * math.pi / 100,
                                              child: InkWell(
                                                onTap: () {
                                                  if (subcomment.dislike!
                                                      .contains(
                                                          constusermodel.id)) {
                                                  } else {
                                                    BlocProvider.of<
                                                                CommentBloc>(
                                                            context)
                                                        .add(DislikeSubComment(
                                                            commentid:
                                                                commentlist[
                                                                        index]
                                                                    .id
                                                                    .toString(),
                                                            index: index,
                                                            subindex:
                                                                subindex));
                                                  }
                                                },
                                                child: Icon(
                                                  (subcomment.dislike!.contains(
                                                          constusermodel.id))
                                                      ? Icons.favorite_rounded
                                                      : Icons
                                                          .favorite_border_outlined,
                                                  size: width / 20,
                                                  color: (subcomment.dislike!
                                                          .contains(
                                                              constusermodel
                                                                  .id))
                                                      ? Colors.red
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              kmbgenerator(
                                                  subcomment.dislike!.length),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: width / 30),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ],
                  ),
                );
              });
        }
      }),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: height / 10,
          child: ValueListenableBuilder(
              valueListenable: currentsub,
              builder: (context, Map<String, dynamic> subcomment, _) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width / 1.15,
                      height: height / 11,
                      child: TextFormField(
                        controller: commentController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        maxLength: 1000,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: (subcomment["issub"])
                              ? "Reply to comment..."
                              : "Comment.....",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: height / 100,
                        ),
                        IconButton(
                          onPressed: () async {
                            log(subcomment["issub"].toString());
                            if (commentController.text.isNotEmpty) {
                              DateTime time = DateTime.now().toUtc();
                              Map<String, dynamic> data = (subcomment["issub"])
                                  ? {
                                      "commentid": subcomment["commentid"],
                                      "commenttext":
                                          commentController.text.toString(),
                                      "commenttime": time.toString()
                                    }
                                  : {
                                      "postid": widget.postid,
                                      "commenttext":
                                          commentController.text.toString(),
                                      "commenttime": time.toString()
                                    };

                              (subcomment["issub"])
                                  ? BlocProvider.of<CommentBloc>(context).add(
                                      AddSubComment(
                                          data: data,
                                          index: subcomment["commentindex"]))
                                  : BlocProvider.of<CommentBloc>(context)
                                      .add(AddComment(data: data));

                              commentController.clear();
                              FocusManager.instance.primaryFocus?.unfocus();

                              // final resp =
                              //     await Commentimplementation().postComment(data);
                              // resp.fold((MainFailure failure) {
                              //   failure.whenOrNull(
                              //     clientFailure: (String error) {
                              //       basicScaffoldmsg(context, error);
                              //     },
                              //     serverFailure: (ServerErrorModel error) {
                              //       basicScaffoldmsg(context, error.msg.toString());
                              //     },
                              //   );
                              // }, (CommentModel commentModel) {
                              //   Navigator.pop(context);
                              // });
                            }
                          },
                          icon: Center(
                            child: Icon(
                              Icons.send_sharp,
                              color: appColor,
                              size: width / 13,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
