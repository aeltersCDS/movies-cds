import 'package:flutter/material.dart';
import 'package:movies_cds/layers/presentation/pages/movies/movies_page.dart';
import 'package:movies_cds/layers/presentation/pages/people/people_page.dart';
import 'package:movies_cds/layers/presentation/pages/settings/view/settings_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: const Icon(Icons.movie),
            label: localizations.movies,
          ),
          NavigationDestination(
            icon: const Icon(Icons.people),
            label: localizations.people,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: localizations.settings,
          ),
        ],
      ),
      body: <Widget>[
        const MoviesPage(),
        const PeoplePage(),
        const SettingsPage()
      ][_selectedIndex],
    );
  }
}
