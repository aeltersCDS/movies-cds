import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  String? title,
  String? message,
  String? buttonText,
  required void Function() onButtonTap,
}) {
  final AppLocalizations localizations = AppLocalizations.of(context)!;
  final errorTitle = title ?? localizations.generalErrorTitle;
  final errorMessage = title ?? localizations.generalErrorMessage;
  final errorButton = buttonText ?? localizations.ok;
  return tmdbDialog(
    context: context,
    title: errorTitle,
    message: errorMessage,
    positiveButton: DialogButton(
      text: errorButton,
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
