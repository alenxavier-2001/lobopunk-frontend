import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/post_notifier.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/presentation/account/widgets/account_post_setion.dart';
import 'package:lobopunk/presentation/main_page/main_page_screen.dart';
import 'package:lobopunk/widgets/custom_loader.dart';

class AccountPostGirdView extends StatelessWidget {
  final bool isprev;
  final String currentpostid;
  const AccountPostGirdView(
      {Key? key, this.isprev = false, this.currentpostid = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
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
            physics: (isprev) ? null : const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return (currentpostid == userposts[index].id)
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.all(width / 90),
                      child: InkWell(
                        onTap: () async {
                          if (isprev) {
                            Map<String, dynamic> data = {
                              "postid": currentpostid,
                              "pastpost": userposts[index].id,
                            };
                            final res =
                                await UserImplementation().editPost(data);
                            res.fold((l) {}, (r) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPageScreen()));
                            });
                          } else {
                            postListNotifier.value = userposts;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountPostPageView(
                                          pagenumber: index,
                                        )));
                          }
                        },
                        child: Container(
                          width: width / 2.5,
                          height: height / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
    });
  }
}
