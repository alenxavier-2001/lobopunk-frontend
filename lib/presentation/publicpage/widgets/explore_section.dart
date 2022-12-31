import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/publicpage/publicpage_bloc.dart';
import 'package:lobopunk/domain/exporepage/explore_page_model/result.dart';
import 'package:lobopunk/domain/hashtags/hastag_model/hastag_model.dart';
import 'package:lobopunk/presentation/publicpage/public_screen.dart';
import 'package:lobopunk/presentation/publicpage/widgets/hashtag_gird_widget.dart';
import 'package:lobopunk/presentation/publicpage/widgets/publicpost_gird_view.dart';
import 'package:lobopunk/widgets/custom_loader.dart';

class ExploreSectionWidget extends StatelessWidget {
  const ExploreSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocBuilder<PublicpageBloc, PublicpageState>(
        builder: (context, state) {
      if (state.isLoading) {
        return const CustomLoader();
      } else if (state.hasError) {
        return const Center(
          child: Text("Error Occur"),
        );
      } else {
        List<Result> resultList = state.explorepage.results ?? [];
        return ValueListenableBuilder(
            valueListenable: hashtagindex,
            builder: (context, value, _) {
              List<HashtagModel> hashtaglist = state.hashtagList;
              if ((value == 0)) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: resultList.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: height / 2.8,
                          width: width * 2.2,
                          child: Row(
                            children: [
                              SizedBox(
                                height: height / 8,
                                width: width / 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.local_fire_department_sharp,
                                      size: width / 5,
                                      color: Colors.red,
                                    ),
                                    Text((resultList.isEmpty)
                                        ? ""
                                        : "${resultList[index].hashtag}")
                                  ],
                                ),
                              ),
                              PublicPostGirdView(
                                postlist: resultList[index].posts ?? [],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const HashTagGirdWidget();
              }
            });
      }
    });
  }
}
