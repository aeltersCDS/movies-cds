import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';
import 'package:movies_cds/layers/presentation/pages/movies/common/widget/movie_list_page.dart';
import 'package:movies_cds/layers/presentation/pages/movies/top_rated/top_rated_movies_view_model.dart';
import 'package:movies_cds/layers/presentation/common/widget/list_loading_item.dart';
import 'package:movies_cds/layers/presentation/pages/movies/common/widget/movie_list_item.dart';

class TopRatedMoviesPage extends ConsumerStatefulWidget {
  const TopRatedMoviesPage({super.key});

  @override
  ConsumerState<TopRatedMoviesPage> createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends ConsumerState<TopRatedMoviesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(topRatedMoviesViewModelProvider.notifier).fetchNextPage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(topRatedMoviesViewModelProvider);
    final list = state.movies;
    final status = state.status;
    final hasEnded = state.hasReachedEnd;
    return MovieListPage(
      status: status,
      list: list,
      hasEnded: hasEnded,
      onRetryTap: _fetchNextPage,
      onLoadNextPage: _fetchNextPage,
      onMovieTap: _goToMovieDetails,
    );
  }

  void _fetchNextPage() {
    ref.read(topRatedMoviesViewModelProvider.notifier).fetchNextPage();
  }

  void _goToMovieDetails(Movie movie) {
    context.pushNamed("movie_detail", extra: movie);
  }

  @override
  bool get wantKeepAlive => true;
}
