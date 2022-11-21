import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/core/router.dart';

import 'package:lobopunk/domain/core/di/injectable.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';
import 'package:lobopunk/presentation/account/account_screen.dart';
import 'package:lobopunk/presentation/addpost/addpost.dart';
import 'package:lobopunk/presentation/auth/signin/signin.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<AccountBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color.fromARGB(255, 33, 32, 32),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 33, 32, 32),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            headlineMedium: TextStyle(color: Colors.white),
          ),

          // This is the theme of your application.
          //
          // Try runnboing your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const HomeScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getUserAndNav();
    super.initState();
  }

  getUserAndNav() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";

    if (token.isNotEmpty || token != "") {
      final res = await AuthImplementation().tokenValidation(token);

      res.fold((l) {
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      }, (bool val) {
        if (val) {
          Timer(const Duration(milliseconds: 500), () {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          });
        } else {
          Navigator.pushReplacementNamed(context, SignInScreen.routeName);
        }
      });
    } else {
      await prefs.setString('token', "").then((value) {
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.jpg',
      fit: BoxFit.cover,
    );
  }
}
