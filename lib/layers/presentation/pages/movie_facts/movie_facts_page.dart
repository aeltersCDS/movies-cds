import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/pages/movie_facts/movie_facts_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_cds/layers/presentation/pages/movie_facts/widget/movie_fact_item.dart';

class MovieFactsPage extends ConsumerStatefulWidget {
  const MovieFactsPage({required this.movie, super.key});
  final Movie movie;

  @override
  ConsumerState<MovieFactsPage> createState() => _MovieFactsPageState();
}

class _MovieFactsPageState extends ConsumerState<MovieFactsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(movieFactsViewModelProvider.notifier)
          .initWithMovie(widget.movie);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(movieFactsViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Facts"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Close',
            onPressed: () {
              context.pop();
            },
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(height: 24.0),
        itemCount: state.facts?.length ?? 0,
        itemBuilder: (context, index) {
          final item = state.facts![index];
          return MovieFactItem(
            label: item.label,
            value: item.value,
          );
        },
      ),
    );
  }
}
