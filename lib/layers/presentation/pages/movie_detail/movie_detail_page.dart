import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/pages/movie_detail/movie_detail_view_model.dart';
import 'package:movies_cds/layers/presentation/pages/movie_detail/widget/cast_member_list_item.dart';

class MovieDetailPage extends ConsumerStatefulWidget {
  const MovieDetailPage({required this.movie, super.key});
  final Movie movie;

  @override
  ConsumerState<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends ConsumerState<MovieDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(movieDetailViewModelProvider.notifier)
          .initWithMovie(widget.movie);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(movieDetailViewModelProvider);
    final movie = state.movie;
    final cast = state.cast ?? [];
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const horizontalPadding = EdgeInsets.fromLTRB(16, 0, 16, 0);
    return Container(
      color: colorScheme.surface,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              ),
              floating: false,
              pinned: true,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.network(
                  movie?.posterUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: horizontalPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        movie?.title ?? "",
                        style: textTheme.displaySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: _navigateToMovieInfo,
                      icon: const Icon(Icons.info_outline),
                      color: colorScheme.secondary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: horizontalPadding,
                child: Text(
                  "User Score",
                  style: textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: horizontalPadding,
                child: Text(
                  movie?.voteAverage.toString() ?? "",
                  style: textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: horizontalPadding,
                child: Text(
                  "Overview",
                  style: textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: horizontalPadding,
                child: Text(
                  movie?.overview ?? "",
                  style: textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: horizontalPadding,
                child: Text(
                  "Top Billed Cast",
                  style: textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              Builder(builder: (context) {
                if (cast.isEmpty) return const SizedBox();
                return SizedBox(
                  height: 190,
                  child: ListView.separated(
                    padding: horizontalPadding,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CastMemberListItem(person: cast[index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16.0),
                    itemCount: cast.length,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToMovieInfo() {}
}
