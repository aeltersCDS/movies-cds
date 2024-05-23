import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cds/layers/presentation/pages/movies/common/movies_page_state.dart';
import 'package:movies_cds/layers/presentation/pages/movies/top_rated/top_rated_movies_view_model.dart';
import 'package:movies_cds/layers/presentation/pages/movies/common/widget/list_loading_item.dart';
import 'package:movies_cds/layers/presentation/pages/movies/common/widget/movie_list_item.dart';

class TopRatedMoviesPage extends ConsumerStatefulWidget {
  const TopRatedMoviesPage({super.key});

  @override
  ConsumerState<TopRatedMoviesPage> createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends ConsumerState<TopRatedMoviesPage>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(topRatedMoviesViewModelProvider.notifier).fetchNextPage();
    });
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(topRatedMoviesViewModelProvider);
    final list = state.movies;
    final status = state.status;
    final hasEnded = state.hasReachedEnd;
    return Builder(
      builder: (context) {
        if (status == MoviesPageStatus.initial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => const SizedBox(height: 4.0),
            itemCount: hasEnded ? list.length : list.length + 1,
            itemBuilder: (context, index) {
              if (index >= list.length) {
                return !hasEnded ? const ListLoadingItem() : const SizedBox();
              }
              return MovieListItem(movie: list[index]);
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      ref.read(topRatedMoviesViewModelProvider.notifier).fetchNextPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  bool get wantKeepAlive => true;
}
