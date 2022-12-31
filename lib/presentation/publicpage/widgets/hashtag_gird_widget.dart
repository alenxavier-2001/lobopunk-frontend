import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/hashtag_screen/hashtagscreen_bloc.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/presentation/publicpage/widgets/public_post_view.dart';
import 'package:lobopunk/presentation/publicpage/widgets/public_post_widget.dart';
import 'package:lobopunk/widgets/custom_loader.dart';

class HashTagGirdWidget extends StatelessWidget {
  const HashTagGirdWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HashtagscreenBloc, HashtagscreenState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CustomLoader();
        } else if (state.hasError) {
          return const Center(
            child: Text("Error Occur"),
          );
        } else {
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.posts.results!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                PostModel postdata = state.posts.results![index];
                return InkWell(
                  onTap: () {
                    postListNotifier.value = state.posts.results ?? [];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostPageView(
                                  pagenumber: index,
                                )));
                  },
                  child: PublicPostWidget(
                    url: "$kBaseurl${postdata.thumbnailurl}",
                  ),
                );
              });
        }
      },
    );
  }
}
