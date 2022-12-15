import 'package:flutter/material.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/presentation/account/widgets/account_post_girdview.dart';

class PostPrevEdit extends StatelessWidget {
  final PostModel postdata;
  const PostPrevEdit({super.key, required this.postdata});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Select previous post"),
      ),
      body: AccountPostGirdView(
        isprev: true,
        currentpostid: postdata.id.toString(),
      ),
    );
  }
}
