import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.title,
    this.message,
    this.buttonText,
    required this.onButtonTap,
  });

  final String? title;
  final String? message;
  final String? buttonText;
  final void Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? localizations.generalErrorTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10.0),
          Text(
            message ?? localizations.generalErrorMessage,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: onButtonTap,
            child: Text(buttonText ?? localizations.retry),
          )
        ],
      ),
    );
  }
}
