import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lobopunk/core/basic_scafoldmsg.dart';
import 'package:lobopunk/presentation/account/account_screen.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';
import 'package:lobopunk/presentation/main_page/bottom_nav.dart';
import 'package:lobopunk/presentation/notification/notification_screen.dart';
import 'package:lobopunk/presentation/publicpage/public_screen.dart';

class MainPageScreen extends StatelessWidget {
  final PendingDynamicLinkData? initialLink;
  static const String routeName = '/mainpage-screen';
  MainPageScreen({super.key, this.initialLink});
  final _pages = [
    const HomeScreen(),
    PublicScreen(),
    const Center(child: Text("Add post")),
    const NotificationScreen(),
    const AccountScreen(),
  ];
  handledynamic(
    PendingDynamicLinkData nitialLink,
  ) async {
    if (nitialLink != null) {
      final Uri deepLink = nitialLink.link;
      final PendingDynamicLinkData? link =
          await FirebaseDynamicLinks.instance.getDynamicLink(deepLink);
      if (link!.link.path.contains('/posts')) {
        final String postId = link.link.path.split('/post/')[1];
        navIndexChangeNotifier.value = 4;

        log(postId);
      }
    }
  }

  Future<String> getlink(
    PendingDynamicLinkData nitialLink,
  ) async {
    final Uri deepLink = nitialLink.link;
    final PendingDynamicLinkData? link =
        await FirebaseDynamicLinks.instance.getDynamicLink(deepLink);
    return link!.link.path;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (navIndexChangeNotifier.value == 0) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        } else {
          if (navIndexChangeNotifier.value == 3) {
            navIndexChangeNotifier.value = navIndexChangeNotifier.value - 2;
          } else {
            navIndexChangeNotifier.value = navIndexChangeNotifier.value - 1;
          }
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
          valueListenable: navIndexChangeNotifier,
          builder: ((context, int index, _) {
            return _pages[index];
          }),
        ),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}
