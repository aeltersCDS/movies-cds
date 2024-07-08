import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/pages/movies/common/widget/movie_list_page.dart';
import 'package:movies_cds/layers/presentation/pages/movies/popular/popular_movies_view_model.dart';

class PopularMoviesPage extends ConsumerStatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  ConsumerState<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends ConsumerState<PopularMoviesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(popularMoviesViewModelProvider.notifier).fetchNextPage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(popularMoviesViewModelProvider);
    final list = state.movies;
    final status = state.status;
    final hasEnded = state.hasReachedEnd;
    return MovieListPage(
      status: status,
      list: list,
      hasEnded: hasEnded,
      onLoadNextPage: _fetchNextPage,
      onRetryTap: _fetchNextPage,
      onMovieTap: _goToMovieDetails,
    );
  }

  void _fetchNextPage() {
    ref.read(popularMoviesViewModelProvider.notifier).fetchNextPage();
  }

  void _goToMovieDetails(Movie movie) {
    context.pushNamed("movie_detail", extra: movie);
  }

  @override
  bool get wantKeepAlive => true;
}
