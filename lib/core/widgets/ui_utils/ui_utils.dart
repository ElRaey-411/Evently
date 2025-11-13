import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtils {
  static void showLoading(BuildContext context, {bool isDismissible = true}) {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) => PopScope(
        canPop: isDismissible,
        child: CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: Theme.of(context).primaryColor),
            ],
          ),
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(
          message,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }

  static void toastMessage(String message, Color bgColor) {
    Fluttertoast.showToast(msg: message,
    gravity: ToastGravity.BOTTOM,
      backgroundColor: bgColor,
      textColor: ColorsManager.white,
      fontSize: 16,
    );
  }
}
