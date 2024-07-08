import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/pages/movie_facts/movie_facts_page_state.dart';
import 'package:movies_cds/layers/presentation/pages/movie_facts/movie_facts_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_cds/layers/presentation/pages/movie_facts/widget/movie_fact_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final state = ref.watch(movieFactsViewModelProvider);
    final status = state.status;
    final releaseDate = state.releaseDate;
    final originalLanguage = state.originalLanguage;
    final runtime = state.runtime;
    final budget = state.budget;
    final revenue = state.revenue;
    List<MovieFact> facts = [];

    if (status != null) {
      facts.add(
        MovieFact(
          label: localizations.status,
          value: status,
        ),
      );
    }

    if (releaseDate != null) {
      facts.add(
        MovieFact(
          label: localizations.releaseDate,
          value: _formatDate(releaseDate, localizations.localeName),
        ),
      );
    }

    if (originalLanguage != null) {
      facts.add(
        MovieFact(
          label: localizations.originalLanguage,
          value: originalLanguage,
        ),
      );
    }

    if (runtime != null) {
      facts.add(
        MovieFact(
          label: localizations.runtime,
          value: _formatRuntime(runtime),
        ),
      );
    }

    if (budget != null) {
      facts.add(
        MovieFact(
          label: localizations.budget,
          value: _formatMoney(budget),
        ),
      );
    }

    if (revenue != null) {
      facts.add(
        MovieFact(
          label: localizations.revenue,
          value: _formatMoney(revenue),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.movieFacts),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: localizations.close,
            onPressed: () {
              context.pop();
            },
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(height: 24.0),
        itemCount: facts.length,
        itemBuilder: (context, index) {
          final item = facts[index];
          return MovieFactItem(
            label: item.label,
            value: item.value,
          );
        },
      ),
    );
  }

  String _formatRuntime(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    return '${hours}h ${minutes}m';
  }

  String _formatMoney(int money) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: "en-US",
      symbol: '\$',
      decimalDigits: 2,
    );
    return currencyFormatter.format(money);
  }

  String _formatDate(DateTime date, String locale) {
    DateFormat dateFormat = DateFormat("MMMM d, yyyy", locale);
    return toBeginningOfSentenceCase(dateFormat.format(date));
  }
}
