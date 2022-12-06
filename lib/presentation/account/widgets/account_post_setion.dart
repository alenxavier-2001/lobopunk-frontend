import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/snapnotifier.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/widgets/custom_loader.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';
import 'package:lobopunk/widgets/post_widget.dart';

class AccountPostSection extends StatelessWidget {
  const AccountPostSection({
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
        BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
          if (state.isLoading) {
            return const CustomLoader();
          } else if (state.hasError) {
            return const Center(
              child: Text("Error Occur"),
            );
          } else {
            List<PostModel> userposts = state.userposts.results ?? [];

            return GridView.builder(
                itemCount: userposts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(width / 90),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountPostPageView(
                                      pagenumber: index,
                                    )));
                      },
                      child: Container(
                        width: width / 2.5,
                        height: height / 4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "$kBaseurl${userposts[index].thumbnailurl}"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  );
                });
          }
        }),
        //const MySizedBox(),
      ],
    );
  }
}

class AccountPostPageView extends StatelessWidget {
  final int pagenumber;
  const AccountPostPageView({super.key, required this.pagenumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
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
                  index: index,
                  data: userposts[index],
                );
              });
        }
      }),
    );
  }
}
