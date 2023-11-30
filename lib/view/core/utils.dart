import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class Utils {
  static showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: kPrimaryColor,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kCardColor,
      reverseAnimationCurve: Curves.easeOut,
    );
  }

  static showAlertDialogBox(
      BuildContext ctx, String title, String message,String buttonTxt, VoidCallback onPressed) {
    Get.defaultDialog(
      title: title,
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Cancel',
            style: Theme.of(ctx).textTheme.bodyLarge,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
            textStyle:
                MaterialStatePropertyAll(Theme.of(ctx).textTheme.bodyLarge),
          ),
          onPressed: onPressed,
          child: Text(buttonTxt),
        ),
      ],
    );
  }
}
