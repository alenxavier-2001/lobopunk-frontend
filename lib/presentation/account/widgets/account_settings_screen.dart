import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lobopunk/infrastructure/auth/auth_impl.dart';
import 'package:lobopunk/infrastructure/common_impl/common_impl.dart';
import 'package:lobopunk/presentation/auth/signup/signup.dart';
import 'package:lobopunk/widgets/mysizedbox70.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MySizedBox70(),
            InkWell(
              onTap: () {
                CommonImplementation().launchInBrowser(Uri.parse(
                    "https://lobopunk-2d9c4.web.app/#/communityguidelines"));
              },
              child: Text(
                "Community Guidelines",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: width / 20),
              ),
            ),
            const MySizedBox70(),
            InkWell(
              onTap: () {
                CommonImplementation().launchInBrowser(Uri.parse(
                    "https://lobopunk-2d9c4.web.app/#/privacypolicy"));
              },
              child: Text(
                "Privacy & Policy",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: width / 20),
              ),
            ),
            const MySizedBox70(),
            InkWell(
              onTap: () async {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'your request will send after serval days it will be deleted')));
              },
              child: Text(
                "Delete your account",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: width / 20, color: Colors.red),
              ),
            ),
            const MySizedBox70(),
            InkWell(
              onTap: () async {
                final res = await AuthImplementation().signOut();
                res.fold(
                  (l) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('some error')));
                  },
                  (bool r) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                );
              },
              child: Text(
                "Logout",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: width / 20, color: Colors.red),
              ),
            ),
            const MySizedBox70(),
          ],
        ),
      ),
    );
  }
}
