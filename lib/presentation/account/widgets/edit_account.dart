import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/core/change_file_name.dart';
import 'package:lobopunk/core/color.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';
import 'package:lobopunk/infrastructure/file_picker_impl/file_picker_impl.dart';
import 'package:lobopunk/presentation/account/account_screen.dart';
import 'package:lobopunk/widgets/curved_elevated_button.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';
import 'package:lobopunk/widgets/paratextfeild.dart';
import 'package:lobopunk/widgets/show_error_msg.dart';
import 'package:lobopunk/widgets/textformfieldcurved.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/editprofile-screen';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File image = File("");

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
    bioController.dispose();
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Edit Profile"),
      ),
      body: BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text("Error Occur"),
          );
        } else {
          UserModel usedata = state.userDetails;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: width / 2.5,
                      child: Stack(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: width / 5,
                              backgroundColor: Colors.grey.shade200,
                              backgroundImage: (usedata.profileimage == "" ||
                                      usedata.profileimage == null)
                                  ? null
                                  : NetworkImage(
                                      "$kBaseurl${usedata.profileimage}"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: width / 18,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: appColor,
                                ),
                                onPressed: () async {
                                  final res = await FilePickerImplementation()
                                      .addImage();
                                  res.fold((l) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('some error in gallery')));
                                  }, (File file) async {
                                    String proimg =
                                        changeFileName(file, "profile.jpg");

                                    BlocProvider.of<AccountBloc>(context).add(
                                        ChangeProfileImage(file: File(proimg)));
                                    await CachedNetworkImage.evictFromCache(
                                            "$kBaseurl${usedata.profileimage}")
                                        .whenComplete(
                                            () => Navigator.pop(context));
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const MySizedBox70(),
                  isUserNameAvailable
                      ? ShowErrorWidget(
                          content: "Username is available",
                          tilecolor: Colors.green,
                          onclose: () {
                            setState(() {
                              isUserNameAvailable = false;
                            });
                          },
                        )
                      : isUserNameTaken
                          ? ShowErrorWidget(
                              content: "Username is already taken",
                              tilecolor: Colors.red,
                              onclose: () {
                                setState(() {
                                  isUserNameTaken = false;
                                });
                              },
                            )
                          : Container(),
                  const MySizedBox70(),
                  Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormFieldCurvedWidget(
                              username: true,
                              hinttext: usedata.username.toString(),
                              controller: usernameController),
                          TextFormFieldCurvedWidget(
                              hinttext: usedata.name.toString(),
                              controller: nameController),
                          TextFormField(
                            controller: bioController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            maxLength: 200,
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText:
                                  (usedata.bio == "" || usedata.bio == null)
                                      ? "Bio....."
                                      : usedata.bio,
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ],
                      )),
                  const MySizedBox70(),
                  SizedBox(
                    width: width / 1.5,
                    height: height / 14,
                    child: CurvedElevatedButton(
                        text: "Save",
                        background: appColor,
                        onpress: () async {
                          String username = (usedata.username.toString() !=
                                  usernameController.text.toString())
                              ? usernameController.text.toString()
                              : "";

                          String name = (usedata.name.toString() !=
                                  nameController.text.toString())
                              ? nameController.text.toString()
                              : "";
                          String bio = (usedata.bio.toString() !=
                                  bioController.text.toString())
                              ? bioController.text.toString()
                              : "";
                          Map<String, dynamic> data = {
                            "username": username,
                            "name": name,
                            "userbio": bio,
                          };
                          BlocProvider.of<AccountBloc>(context)
                              .add(EditProfile(data: data));
                          await CachedNetworkImage.evictFromCache(
                                  "$kBaseurl${usedata.profileimage}")
                              .whenComplete(() => Navigator.pop(context));
                        }),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
