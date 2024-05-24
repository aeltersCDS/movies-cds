import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';
import 'package:movies_cds/layers/presentation/pages/movies/popular/popular_movies_view_model.dart';
import 'package:movies_cds/layers/presentation/common/widget/list_loading_item.dart';
import 'package:movies_cds/layers/presentation/pages/movies/common/widget/movie_list_item.dart';

class PopularMoviesPage extends ConsumerStatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  ConsumerState<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends ConsumerState<PopularMoviesPage>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(popularMoviesViewModelProvider.notifier).fetchNextPage();
    });
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(popularMoviesViewModelProvider);
    final list = state.movies;
    final status = state.status;
    final hasEnded = state.hasReachedEnd;
    return Builder(
      builder: (context) {
        if (status == PageStatus.initial || list.isEmpty) {
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
      ref.read(popularMoviesViewModelProvider.notifier).fetchNextPage();
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
