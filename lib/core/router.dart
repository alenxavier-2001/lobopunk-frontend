import 'package:flutter/material.dart';
import 'package:lobopunk/presentation/account/account_screen.dart';
import 'package:lobopunk/presentation/auth/signin/signin.dart';
import 'package:lobopunk/presentation/auth/signup/signup.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());

    case AccountScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AccountScreen());

    case SignUpScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SignUpScreen());
    case SignInScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SignInScreen());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Text("Erroor"),
              ));
  }
}
