import 'package:flutter/material.dart';


final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackBar(BuildContext context, String text) {
  rootScaffoldMessengerKey.currentState!
      .showSnackBar(SnackBar(content: Text(text)));
}