import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/presentation/app_root.dart';
import 'package:movies_cds/layers/presentation/common/styles/styles.dart';
import 'package:movies_cds/layers/presentation/pages/movie_cast_crew/movie_cast_crew_page.dart';
import 'package:movies_cds/layers/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:movies_cds/layers/presentation/pages/movie_facts/movie_facts_page.dart';
import 'package:movies_cds/layers/presentation/pages/person_detail/person_detail_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const AppRoot(),
    ),
    GoRoute(
      name: 'movie_detail',
      path: '/movie_detail',
      builder: (context, state) {
        final movie = state.extra as Movie;
        return MovieDetailPage(movie: movie);
      },
    ),
    GoRoute(
      name: 'movie_facts',
      path: '/movie_detail/facts',
      builder: (context, state) {
        final movie = state.extra as Movie;
        return MovieFactsPage(movie: movie);
      },
    ),
    GoRoute(
      name: 'movie_cast_crew',
      path: '/movie_detail/cast_crew',
      builder: (context, state) {
        final data = state.extra as MovieCastCrewData;
        return MovieCastCrewPage(data: data);
      },
    ),
    GoRoute(
      name: 'person_detail',
      path: '/person_detail',
      builder: (context, state) {
        final person = state.extra as Person;
        return PersonDetailPage(person: person);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Movies CDS',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: _router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
