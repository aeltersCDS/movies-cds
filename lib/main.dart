import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/app_root.dart';
import 'package:movies_cds/layers/presentation/common/styles/styles.dart';
import 'package:movies_cds/layers/presentation/pages/movie_detail/movie_detail_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name:
          'home', // Optional, add name to your routes. Allows you navigate by name instead of path
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
    );
  }
}
