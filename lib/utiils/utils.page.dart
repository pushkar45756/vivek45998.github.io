import 'package:flutter/material.dart';
import 'package:web/extention_function.dart';
import 'package:web/values/app_colors.dart';

class Utils {
  static showSnackBar(String text, context, color) {
    var snackBar = SnackBar(
      content: Text(
        text.capitalize(),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      backgroundColor: color,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> showMyDialog(context, title,
      {required String subTitle}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                //Text('This is a demo alert dialog.'),
                Text(subTitle),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text(
                'Cancel',
                style: TextStyle(
                    color: AppColor.appBarColor, fontWeight: FontWeight.w700),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text(
                'OK',
                style: TextStyle(
                    color: AppColor.appBarColor, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        );
      },
    );
  }
}
