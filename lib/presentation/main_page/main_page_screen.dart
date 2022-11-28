import 'package:flutter/material.dart';
import 'package:lobopunk/presentation/account/account_screen.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';
import 'package:lobopunk/presentation/main_page/bottom_nav.dart';

class MainPageScreen extends StatelessWidget {
  static const String routeName = '/mainpage-screen';
  MainPageScreen({super.key});
  final _pages = [
    HomeScreen(),
    Container(
      child: Center(child: Text("Public")),
    ),
    Container(
      child: Center(child: Text("Add post")),
    ),
    Container(
      child: Center(child: Text("Notification")),
    ),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: ((context, int index, _) {
          return _pages[index];
        }),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
