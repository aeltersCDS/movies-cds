import 'package:flutter/material.dart';
import 'package:movies_cds/layers/presentation/pages/movies/movies_page.dart';
import 'package:movies_cds/layers/presentation/pages/people/people_page.dart';
import 'package:movies_cds/layers/presentation/pages/settings/view/settings_page.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'People',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
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
