import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static mySnackBar(BuildContext context, String data){
    final snackBar = SnackBar(
      content: Text("$data!"),
      duration: const Duration(milliseconds: 300),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}