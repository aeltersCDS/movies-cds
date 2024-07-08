import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.title = "Error",
    this.message = "Something went wrong, please try again.",
    this.buttonText = "Retry",
    required this.onButtonTap,
  });

  final String title;
  final String message;
  final String buttonText;
  final void Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10.0),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: onButtonTap,
            child: Text(buttonText),
          )
        ],
      ),
    );
  }
}
