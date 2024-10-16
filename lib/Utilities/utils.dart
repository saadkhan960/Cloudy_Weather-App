import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, timeInSecForIosWeb: 3);
  }

  static flushBar(BuildContext context, String message, Color color) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          borderRadius: BorderRadius.circular(20),
          forwardAnimationCurve: Curves.decelerate,
          message: message,
          icon: const Icon(Icons.check_circle),
          backgroundColor: color,
          positionOffset: 20,
          duration: const Duration(seconds: 2),
          reverseAnimationCurve: Curves.easeInOut,
        )..show(context));
  }

  static snackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // static fieldFocusNode(
  //     BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  //   currentFocus.unfocus();
  //   FocusScope.of(context).requestFocus(nextFocus);
  // }
}
