import 'dart:developer';

import 'package:expandable_text/expandable_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/application/comment/comment_bloc.dart';
import 'package:lobopunk/core/usernamenotifer.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/widgets/comment_page.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

class PostBottomWidget extends StatelessWidget {
  const PostBottomWidget({super.key, required this.data});
  final PostModel data;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: width / 30, bottom: width / 40, right: width / 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ValueListenableBuilder(
              valueListenable: usernamlists,
              builder: (context, Map<String, dynamic> usernamelists, _) {
                (usernamelists.containsKey(data.userid))
                    ? null
                    : UserImplementation()
                        .getUserName(userid: data.userid.toString());
                return Text(
                  (usernamelists.containsKey(data.userid))
                      ? usernamelists[data.userid]
                      : data.userid,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: width / 20),
                );
              }),
          SizedBox(
            height: height / 70,
          ),
          ExpandableText(
            "${data.description}",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: width / 23),
            expandText: 'more',
            collapseText: 'less',
            expandOnTextTap: true,
            maxLines: 2,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
          const MySizedBox70(),
          InkWell(
            onTap: () {
              BlocProvider.of<CommentBloc>(context)
                  .add(LoadComments(postid: data.id.toString()));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommentPageScreen(
                            postid: data.id.toString(),
                          )));
            },
            child: Container(
              padding: EdgeInsets.only(left: width / 20),
              width: width / 1.1,
              height: height / 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add your comment",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: width / 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
