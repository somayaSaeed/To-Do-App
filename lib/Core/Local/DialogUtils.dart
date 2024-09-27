import 'package:flutter/material.dart';
import 'package:to_do_app/Utils/Color Resources/Color_Resources.dart';

class DialogUtils {

  static void showLoading({required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorResources.bgLightColor,
          content: SizedBox(
            height: 150,
            width: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: ColorResources.babyBlue2,
                  strokeWidth: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String title = '',
    String? posActiveName,
    Function? posAction,
    String? negActiveName,
    Function? negAction,
  }) {
    List<Widget> actions = [];
    Color buttonColor = ColorResources.babyBlue;

    if (posActiveName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          style: TextButton.styleFrom(foregroundColor: buttonColor),
          child: Text(posActiveName, ),
        ),
      );
    }

    if (negActiveName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          style: TextButton.styleFrom(foregroundColor: buttonColor),
          child: Text(negActiveName,),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 150,
          width: 170,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(

                backgroundColor: ColorResources.bgLightColor,

                title: Text(title),
                content: Text(
                  message,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22),

                ),
                actions: actions,
              ),
            ],
          ),
        );
      },
    );
  }
}
