import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';
import 'package:lobopunk/infrastructure/file_picker_impl/file_picker_impl.dart';
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart';

import 'package:lobopunk/presentation/auth/signin/signin.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account-screen';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AccountBloc>(context).add(const LoadUserData());
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Screen"),
      ),
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
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
            log("$kBaseurl${usedata.profileimage}");
            return Padding(
              padding: EdgeInsets.all(width / 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () async {
                        final res = await FilePickerImplementation().addImage();
                        res.fold((l) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('some error')));
                        }, (File file) async {
                          BlocProvider.of<AccountBloc>(context)
                              .add(ChangeProfileImage(file: file));
                        });
                      },
                      child: CircleAvatar(
                        radius: width / 6,
                        backgroundColor: Colors.grey.shade200,
                        backgroundImage: (usedata.profileimage == "" ||
                                usedata.profileimage == null)
                            ? null
                            : NetworkImage("$kBaseurl${usedata.profileimage}"),
                      ),
                    ),
                  ),
                  Text(usedata.email.toString()),
                  Text(usedata.id.toString()),
                  Text(usedata.name.toString()),
                  Text(usedata.username.toString()),
                  ElevatedButton(
                      onPressed: () async {
                        final res = await AuthImplementation().signOut();
                        res.fold((l) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('some error')));
                        }, (bool r) {
                          log("dchdc  dc");
                          Navigator.pushReplacementNamed(
                              context, SignInScreen.routeName);
                        });
                      },
                      child: const Text("Log out")),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
