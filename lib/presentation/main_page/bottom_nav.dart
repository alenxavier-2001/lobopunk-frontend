import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lobopunk/core/basic_scafoldmsg.dart';
import 'package:lobopunk/domain/core/failures/server_error_model/server_error_model.dart';
import 'package:lobopunk/infrastructure/addpost/addpost_impl.dart';
import 'package:lobopunk/presentation/addpost/addpost.dart';

ValueNotifier<int> navIndexChangeNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: navIndexChangeNotifier,
        builder: ((context, int newIndex, _) {
          return BottomNavigationBar(
            onTap: ((indexvalue) async {
              if (indexvalue == 2) {
                final res = await AddPostImplementation().addPostVideo();
                res.fold((l) {
                  l.whenOrNull(
                    clientFailure: (String msg) {
                      basicScaffoldmsg(context, msg);
                      navIndexChangeNotifier.value = 0;
                    },
                    serverFailure: (ServerErrorModel msg) {
                      basicScaffoldmsg(context, msg.msg.toString());
                      navIndexChangeNotifier.value = 0;
                    },
                  );
                }, (File file) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPostScreen(file: file)));
                });
              } else {
                navIndexChangeNotifier.value = indexvalue;
              }
            }),
            currentIndex: newIndex,
            elevation: 0,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: height / 27,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: height / 27,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_box_outlined,
                    size: height / 27,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_outlined,
                    size: height / 27,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    size: height / 27,
                  ),
                  label: ""),
            ],
          );
        }));
  }
}
