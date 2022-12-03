import 'package:flutter/material.dart';

basicScaffoldmsg(BuildContext context, String msg) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    duration: const Duration(seconds: 2),
    // action: SnackBarAction(
    //   label: 'ACTION',
    //   onPressed: () { },
    // ),
  ));
}
