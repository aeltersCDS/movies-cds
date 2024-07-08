import 'package:flutter/material.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';
import 'package:movies_cds/layers/presentation/common/widget/error_page.dart';
import 'package:movies_cds/layers/presentation/common/widget/list_loading_item.dart';
import 'package:movies_cds/layers/presentation/pages/movies/common/widget/movie_list_item.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({
    super.key,
    required this.status,
    required this.list,
    required this.hasEnded,
    required this.onRetryTap,
    required this.onLoadNextPage,
    required this.onMovieTap,
  });

  final PageStatus status;
  final List<Movie> list;
  final bool hasEnded;
  final void Function() onLoadNextPage;
  final void Function() onRetryTap;
  final void Function(Movie) onMovieTap;

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.status == PageStatus.failure) {
          return ErrorPage(
            onButtonTap: () => widget.onRetryTap(),
          );
        } else if (widget.status == PageStatus.loading && widget.list.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => const SizedBox(height: 4.0),
            itemCount:
                widget.hasEnded ? widget.list.length : widget.list.length + 1,
            itemBuilder: (context, index) {
              if (index >= widget.list.length) {
                return !widget.hasEnded
                    ? const ListLoadingItem()
                    : const SizedBox();
              }
              final movie = widget.list[index];
              return MovieListItem(
                movie: movie,
                onTap: () => widget.onMovieTap(movie),
              );
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
      widget.onLoadNextPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
