import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/notification/notification_bloc.dart';
import 'package:lobopunk/application/profile_view/profileview_bloc.dart';

import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/usernamenotifer.dart';
import 'package:lobopunk/domain/repost/repost_request_model/repost_request_model.dart';
import 'package:lobopunk/infrastructure/post/post_impl.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';
import 'package:lobopunk/presentation/main_page/bottom_nav.dart';
import 'package:lobopunk/presentation/main_page/main_page_screen.dart';
import 'package:lobopunk/presentation/profile_view/profile_view_screen.dart';
import 'package:lobopunk/widgets/curved_elevated_button.dart';
import 'package:lobopunk/widgets/custom_loader.dart';

class RequestsScreen extends StatelessWidget {
  final bool isreceived;

  const RequestsScreen({super.key, required this.isreceived});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(body: SingleChildScrollView(
      child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CustomLoader());
        } else if (state.hasError) {
          return const Center(
            child: Text("Error Occur"),
          );
        } else {
          List<RepostRequestModel> rqsrList =
              isreceived ? state.receivedrequests : state.sendrequests;
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                  padding: EdgeInsets.all(width / 20),
                  child: ListView.builder(
                    itemCount: rqsrList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      RepostRequestModel rqstdata = rqsrList[index];
                      return SizedBox(
                        height: height / 7,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: width / 11,
                              backgroundImage: NetworkImage(
                                  "$kBaseurl${rqstdata.thumbnail.toString()}"),
                            ),
                            SizedBox(
                              width: width / 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (rqstdata.repostuserid ==
                                        constusermodel.value.id) {
                                      navIndexChangeNotifier.value = 4;
                                    } else {
                                      BlocProvider.of<ProfileviewBloc>(context)
                                          .add(LoadProfileData(
                                              userid: rqstdata.repostuserid
                                                  .toString()));

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfileViewScreen()));
                                    }
                                  },
                                  child: ValueListenableBuilder(
                                      valueListenable: usernamlists,
                                      builder: (context,
                                          Map<String, dynamic> usernamelists,
                                          _) {
                                        (usernamelists.containsKey(
                                                rqstdata.repostuserid))
                                            ? null
                                            : UserImplementation().getUserName(
                                                userid: rqstdata.repostuserid
                                                    .toString());
                                        return Text(
                                          (usernamelists.containsKey(
                                                  rqstdata.repostuserid))
                                              ? usernamelists[
                                                  rqstdata.repostuserid]
                                              : rqstdata.repostuserid,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(fontSize: width / 20),
                                        );
                                      }),
                                ),
                                Text(
                                  "requested to repost this post",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: width / 22,
                                          fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                isreceived
                                    ? (rqstdata.approvalstatus == true)
                                        ? Center(
                                            child: SizedBox(
                                              width: width / 2.5,
                                              child: CurvedElevatedButton(
                                                  text: "Remove Splits",
                                                  background: Colors.red,
                                                  fontColor: Colors.white,
                                                  onpress: () {
                                                    BlocProvider.of<
                                                                NotificationBloc>(
                                                            context)
                                                        .add(RejectRqst(
                                                            rqstdata.id
                                                                .toString(),
                                                            index));
                                                  }),
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: width / 3.7,
                                                child: CurvedElevatedButton(
                                                    text: "Approve",
                                                    background: appColor,
                                                    onpress: () {
                                                      BlocProvider.of<
                                                                  NotificationBloc>(
                                                              context)
                                                          .add(ApproveRqst(
                                                              rqstdata.id
                                                                  .toString(),
                                                              index));
                                                      navIndexChangeNotifier
                                                          .value = 0;
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainPageScreen()),
                                                              (Route<dynamic>
                                                                      route) =>
                                                                  false);
                                                    }),
                                              ),
                                              SizedBox(
                                                width: width / 25,
                                              ),
                                              SizedBox(
                                                width: width / 3.7,
                                                child: CurvedElevatedButton(
                                                    text: "Delete",
                                                    background: Colors.red,
                                                    fontColor: Colors.white,
                                                    onpress: () {
                                                      BlocProvider.of<
                                                                  NotificationBloc>(
                                                              context)
                                                          .add(RejectRqst(
                                                              rqstdata.id
                                                                  .toString(),
                                                              index));
                                                    }),
                                              ),
                                            ],
                                          )
                                    : (rqstdata.approvalstatus == true)
                                        ? Center(
                                            child: SizedBox(
                                              width: width / 2.5,
                                              child: CurvedElevatedButton(
                                                  text: "Split the post",
                                                  background: appColor,
                                                  fontColor: Colors.black,
                                                  onpress: () async {
                                                    DateTime time =
                                                        DateTime.now();
                                                    Map<String, dynamic> data =
                                                        {
                                                      "postid": rqstdata.postid,
                                                      "posttime": time
                                                          .toUtc()
                                                          .toString()
                                                    };
                                                    final res =
                                                        await PostImplementation()
                                                            .splitPost(data);

                                                    res.fold((l) {}, (r) {
                                                      navIndexChangeNotifier
                                                          .value = 4;
                                                      BlocProvider.of<
                                                                  NotificationBloc>(
                                                              context)
                                                          .add(RejectRqst(
                                                              rqstdata.id
                                                                  .toString(),
                                                              index));
                                                      Navigator.pop(context);
                                                    });
                                                  }),
                                            ),
                                          )
                                        : Center(
                                            child: SizedBox(
                                              width: width / 2.5,
                                              child: CurvedElevatedButton(
                                                  text: "Delete",
                                                  background: appColor,
                                                  fontColor: Colors.black,
                                                  onpress: () {
                                                    BlocProvider.of<
                                                                NotificationBloc>(
                                                            context)
                                                        .add(DeleteRqst(
                                                            rqstdata.id
                                                                .toString(),
                                                            index));
                                                  }),
                                            ),
                                          )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )),
            ),
          );
        }
      }),
    ));
  }
}
