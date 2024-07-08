import 'package:flutter/material.dart';

Future<void> tmdbDialog({
  required BuildContext context,
  required String title,
  required message,
  bool dismissible = false,
  required DialogButton positiveButton,
  DialogButton? negativeButton,
}) {
  List<Widget> actions = [
    TextButton(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      onPressed: () {
        Navigator.of(context).pop();
        positiveButton.onTap();
      },
      child: Text(positiveButton.text),
    ),
  ];
  if (negativeButton != null) {
    actions.add(
      TextButton(
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        onPressed: () {
          Navigator.of(context).pop();
          negativeButton.onTap();
        },
        child: Text(negativeButton.text),
      ),
    );
  }
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: actions,
      );
    },
  );
}

Future<void> tmdbErrorDialog({
  required BuildContext context,
  String title = "Error",
  String message = "Something went wrong, please try again.",
  String buttonText = "Ok",
  required void Function() onButtonTap,
}) {
  return tmdbDialog(
    context: context,
    title: title,
    message: message,
    positiveButton: DialogButton(
      text: buttonText,
      onTap: onButtonTap,
    ),
  );
}

class DialogButton {
  DialogButton({
    required this.text,
    required this.onTap,
  });

  String text;
  final void Function() onTap;
}
