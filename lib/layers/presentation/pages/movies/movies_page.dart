import 'package:flutter/material.dart';
import 'package:movies_cds/layers/presentation/pages/movies/popular/popular_movies_page.dart';
import 'package:movies_cds/layers/presentation/pages/movies/top_rated/top_rated_movies_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        AppBar(
          title: Text(localizations.movies),
          centerTitle: true,
        ),
        Container(
          color: Theme.of(context).colorScheme.primary,
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: localizations.popular),
              Tab(text: localizations.topRated),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              PopularMoviesPage(),
              TopRatedMoviesPage(),
            ],
          ),
        )
      ],
    );
  }
}
