import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lobopunk/application/account/account_bloc.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';

import 'package:lobopunk/presentation/auth/signin/signin.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account-screen';
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            UserModel model = state.userDetails;
            return Column(
              children: [
                Text(model.email.toString()),
                Text(model.id.toString()),
                Text(model.name.toString()),
                Text(model.username.toString()),
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
            );
          }
        },
      ),
    );
  }
}
