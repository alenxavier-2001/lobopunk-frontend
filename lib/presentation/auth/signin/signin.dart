import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/home/home_bloc.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/domain/auth/auth_model/auth_model.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';

import 'package:lobopunk/presentation/auth/signup/signup.dart';
import 'package:lobopunk/presentation/main_page/main_page_screen.dart';
import 'package:lobopunk/widgets/custom_loader.dart';
import 'package:lobopunk/widgets/mysizedbox.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';
import 'package:lobopunk/widgets/passwordtextfeild.dart';
import 'package:lobopunk/widgets/textformfieldcurved.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signin-screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width / 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MySizedBox70(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage("assets/logo.jpg"),
                    radius: width / 6,
                  ),
                  const MySizedBox(),
                  Text(
                    "You can make",
                    style: TextStyle(
                        fontSize: width / 21, fontWeight: FontWeight.w500),
                  ),
                  const MySizedBox70(),
                  Row(
                    children: [
                      Text(
                        "Money ",
                        style: TextStyle(
                            fontSize: width / 19, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "now ",
                        style: TextStyle(
                            fontSize: width / 22, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const MySizedBox70(),
                  Row(
                    children: [
                      Text(
                        "By your  ",
                        style: TextStyle(
                            fontSize: width / 22, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Contents!",
                        style: TextStyle(
                            fontSize: width / 19, fontWeight: FontWeight.w800),
                      ),
                    ],
                  )
                ],
              ),
              const MySizedBox(),
              Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: width / 19, fontWeight: FontWeight.w800),
                ),
              ),
              const MySizedBox70(),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormFieldCurvedWidget(
                          type: "email",
                          keyboard: TextInputType.emailAddress,
                          hinttext: "Email",
                          controller: emailController),
                      PasswordTextFeild(
                        controller: passwordController,
                        hinttext: "Password",
                      ),
                    ],
                  )),
              const MySizedBox70(),
              const MySizedBox70(),
              Center(
                child: SizedBox(
                  height: height / 18,
                  width: width / 1.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const CustomLoader();
                            });
                        Map data = {
                          "email": emailController.text.toString(),
                          "password": passwordController.text.toString(),
                        };

                        final res = await AuthImplementation().signin(data);
                        res.fold((MainFailure failure) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Some failure')),
                          );
                        }, (AuthModel model) async {
                          String token = model.token!;
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('token', token).then((_) {
                            Navigator.pop(context);
                            BlocProvider.of<HomeBloc>(context)
                                .add(const LoadHomeData());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPageScreen()));
                          });
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Enter all details')));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(appColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ))),
                    child: Text(
                      "Signin",
                      style: TextStyle(
                          fontSize: width / 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              const MySizedBox70(),
              const MySizedBox70(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                child: Center(
                  child: Text(
                    "Don't have an account? Signup",
                    style: TextStyle(
                        fontSize: width / 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
