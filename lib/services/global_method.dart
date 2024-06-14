import 'package:flutter/material.dart';

class GlobalMethods {
  void navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }

  void showCustomAlertDialog({
    required BuildContext ctx,
    required String title,
    required String content,
    required String buttonText,
    Color titleColor = Colors.black,
    Color contentColor = Colors.black54,
    Color buttonTextColor = Colors.white,
    Color buttonColor = Colors.orange,
    IconData? icon,
    Color iconColor = Colors.red,
  }) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor,
                ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            content,
            style: TextStyle(
              color: contentColor,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text(
                buttonText,
                style: TextStyle(
                  color: buttonTextColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
