import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/domain/auth/auth_model/auth_model.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';

import 'package:lobopunk/infrastructure/auth/auth_impl.dart';
import 'package:lobopunk/presentation/account/account_screen.dart';
import 'package:lobopunk/presentation/main_page/main_page_screen.dart';
import 'package:lobopunk/widgets/custom_loader.dart';

import 'package:lobopunk/widgets/mysizedbox.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';
import 'package:lobopunk/widgets/passwordtextfeild.dart';
import 'package:lobopunk/widgets/textformfieldcurved.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSecondpage = false;
  bool isUserNameTaken = false;
  bool isUserNameAvailable = false;
  @override
  void initState() {
    usernameController.addListener(onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    super.dispose();
  }

  onSearchChanged() async {
    String unam = usernameController.text.toString();

    final res = await AuthImplementation().checkUsername(unam);

    res.fold((errorvalue) {}, (boolValue) {
      if (boolValue) {
        setState(() {
          isUserNameTaken = false;
          isUserNameAvailable = true;
        });
      } else {
        setState(() {
          isUserNameAvailable = false;
          isUserNameTaken = true;
        });
      }
    });
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
                  (isSecondpage)
                      ? Text(
                          "You can make",
                          style: TextStyle(
                              fontSize: width / 21,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                          "Start your",
                          style: TextStyle(
                              fontSize: width / 19,
                              fontWeight: FontWeight.w800),
                        ),
                  const MySizedBox70(),
                  (isSecondpage)
                      ? Row(
                          children: [
                            Text(
                              "Money ",
                              style: TextStyle(
                                  fontSize: width / 19,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "now ",
                              style: TextStyle(
                                  fontSize: width / 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      : Text(
                          "Lobopunk Days",
                          style: TextStyle(
                              fontSize: width / 17,
                              fontWeight: FontWeight.w900),
                        ),
                  const MySizedBox70(),
                  (isSecondpage)
                      ? Row(
                          children: [
                            Text(
                              "By your  ",
                              style: TextStyle(
                                  fontSize: width / 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Contents!",
                              style: TextStyle(
                                  fontSize: width / 19,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
              const MySizedBox(),
              // const MySizedBox70(),
              (isSecondpage)
                  ? Container()
                  : Center(
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                            fontSize: width / 23, fontWeight: FontWeight.w700),
                      ),
                    ),
              const MySizedBox70(),
              isUserNameAvailable
                  ? showErrorBadge(
                      context, "Username is available", Colors.green)
                  : isUserNameTaken
                      ? showErrorBadge(
                          context, "Username is already taken", Colors.red)
                      : Container(),
              const MySizedBox70(),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (isSecondpage)
                          ? PasswordTextFeild(
                              controller: passwordController,
                              hinttext: "Create password")
                          : TextFormFieldCurvedWidget(
                              username: true,
                              hinttext: "Username",
                              controller: usernameController),
                      (isSecondpage)
                          ? PasswordTextFeild(
                              controller: repasswordController,
                              hinttext: "Re-enter password")
                          : TextFormFieldCurvedWidget(
                              hinttext: "Name", controller: nameController),
                      (isSecondpage)
                          ? Container()
                          : TextFormFieldCurvedWidget(
                              type: "email",
                              keyboard: TextInputType.emailAddress,
                              hinttext: "Email",
                              controller: emailController),
                    ],
                  )),
              const MySizedBox70(),
              Center(
                child: Text(
                  "By clicking the continue button, you accept the privacy policy and terms and conditions",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: width / 25, fontWeight: FontWeight.w500),
                ),
              ),
              const MySizedBox70(),
              Center(
                child: SizedBox(
                  height: height / 18,
                  width: width / 1.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (isSecondpage) {
                          String pass1 = passwordController.text.toString();
                          String pass2 = repasswordController.text.toString();
                          if (pass1 == pass2) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const CustomLoader();
                                });
                            Map data = {
                              "username": usernameController.text.toString(),
                              "name": nameController.text.toString(),
                              "email": emailController.text.toString(),
                              "password": pass1,
                            };

                            final res = await AuthImplementation().signup(data);
                            res.fold((MainFailure failure) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Some failure')),
                              );
                            }, (AuthModel model) async {
                              String token = model.token!;
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString('token', token).then((_) {
                                Navigator.pop(context);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MainPageScreen()));
                              });
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Password is not match')),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Enter all details')));
                        }
                        setState(() {
                          isSecondpage = true;
                          isUserNameAvailable = false;
                          isUserNameTaken = false;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Enter all details')),
                        );
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
                      "Continue",
                      style: TextStyle(
                          fontSize: width / 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              const MySizedBox70(),
              Center(
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(
                      fontSize: width / 25, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget showErrorBadge(BuildContext context, String content, Color tilecolor) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: tilecolor, borderRadius: BorderRadius.circular(30)),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 30,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
              child: Text(
            content,
          )),
          Center(
            child: IconButton(
              onPressed: () {
                setState(() {
                  isUserNameTaken = false;
                });
              },
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
