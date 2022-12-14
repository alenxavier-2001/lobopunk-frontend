import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/application/comment/comment_bloc.dart';
import 'package:lobopunk/application/hashtag_screen/hashtagscreen_bloc.dart';
import 'package:lobopunk/application/home/home_bloc.dart';
import 'package:lobopunk/application/notification/notification_bloc.dart';
import 'package:lobopunk/application/profile_view/profileview_bloc.dart';
import 'package:lobopunk/application/publicpage/publicpage_bloc.dart';
import 'package:lobopunk/core/common_notifer.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/core/router.dart';

import 'package:lobopunk/domain/core/di/injectable.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';
import 'package:lobopunk/presentation/account/account_screen.dart';
import 'package:lobopunk/presentation/addpost/addpost.dart';
import 'package:lobopunk/presentation/auth/signin/signin.dart';
import 'package:lobopunk/presentation/home/home_screen.dart';
import 'package:lobopunk/presentation/main_page/bottom_nav.dart';
import 'package:lobopunk/presentation/main_page/main_page_screen.dart';
import 'package:lobopunk/widgets/comment_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();

  runApp(MyApp(/*initialLink: initialLink*/));
}

class MyApp extends StatelessWidget {
  final PendingDynamicLinkData? initialLink;
  const MyApp({super.key, this.initialLink});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<HomeBloc>()),
        BlocProvider(create: (ctx) => getIt<AccountBloc>()),
        BlocProvider(create: (ctx) => getIt<CommentBloc>()),
        BlocProvider(create: (ctx) => getIt<PublicpageBloc>()),
        BlocProvider(create: (ctx) => getIt<HashtagscreenBloc>()),
        BlocProvider(create: (ctx) => getIt<ProfileviewBloc>()),
        BlocProvider(create: (ctx) => getIt<NotificationBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lobo punk',
        theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color.fromARGB(255, 33, 32, 32),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 33, 32, 32),
          textTheme: const TextTheme(
            bodyMedium:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            headlineMedium:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
        home: SplashScreen(
          initialLink: initialLink,
        ),
        // home: CommentPageScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final PendingDynamicLinkData? initialLink;
  static const String routeName = '/splash-screen';
  const SplashScreen({super.key, this.initialLink});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    chech();
    getUserAndNav();
    super.initState();
  }

  chech() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      navIndexChangeNotifier.value = 4;
    }

    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      navIndexChangeNotifier.value = 4;
    }).onError((error) {
      // Handle errors
      log(error.toString());
    });
  }

  getUserAndNav() async {
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";
    final String quality = prefs.getString('quality') ?? "Medium";
    qualityNotifier.value = quality;

    if (token.isNotEmpty || token != "") {
      final res = await AuthImplementation().tokenValidation(token);

      res.fold((l) {
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      }, (UserModel val) {
        if (val.id != "") {
          constusermodel.value = val;
          BlocProvider.of<HomeBloc>(context).add(const LoadHomeData());
          Timer(const Duration(milliseconds: 500), () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPageScreen(
                          initialLink: widget.initialLink,
                        )));
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
