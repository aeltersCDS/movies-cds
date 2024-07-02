import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text("Settings"),
          centerTitle: true,
        ),
        const Expanded(child: Placeholder()),
      ],
    );
  }
}
