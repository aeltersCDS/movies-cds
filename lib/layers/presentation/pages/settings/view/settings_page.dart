import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        AppBar(
          title: Text(localizations.settings),
          centerTitle: true,
        ),
        const Expanded(child: Placeholder()),
      ],
    );
  }
}
