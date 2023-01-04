import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/application/profile_view/profileview_bloc.dart';
import 'package:lobopunk/core/common_notifer.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/core/snapnotifier.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/presentation/account/widgets/account_post_girdview.dart';
import 'package:lobopunk/presentation/profile_view/widgets/profile_post_girdview.dart';
import 'package:lobopunk/widgets/custom_loader.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';
import 'package:lobopunk/widgets/post_widget.dart';

class ProfileViewPostSection extends StatelessWidget {
  const ProfileViewPostSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Posts",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: width / 20, fontWeight: FontWeight.w600),
            ),
            Text(
              "Splits",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: width / 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        const MySizedBox70(),
        const ProfileViewPostGirdView(),
        //const MySizedBox(),
      ],
    );
  }
}

class ProfilePostPageView extends StatelessWidget {
  final int pagenumber;
  const ProfilePostPageView({super.key, required this.pagenumber});

  @override
  Widget build(BuildContext context) {
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
          List<PostModel> userposts = state.userposts.results ?? [];
          return PageView.builder(
              controller: PageController(initialPage: pagenumber),
              onPageChanged: (int page) {
                snappedindexhome.value = page;
              },
              scrollDirection: Axis.vertical,
              itemCount: userposts.length,
              itemBuilder: (context, index) {
                return PostWidget(
                    ispost2: true,
                    index: index,
                    data: userposts[index],
                    url: (qualityNotifier.value == "High")
                        ? "${userposts[index].highvideourl}"
                        : (qualityNotifier.value == "Medium")
                            ? "${userposts[index].midvideourl}"
                            : "${userposts[index].lowvideourl}");
              });
        }
      }),
    );
  }
}
