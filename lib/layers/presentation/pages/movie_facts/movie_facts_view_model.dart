import 'package:intl/intl.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/pages/movie_facts/movie_facts_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_facts_view_model.g.dart';

@riverpod
class MovieFactsViewModel extends _$MovieFactsViewModel {
  final DateFormat _format = DateFormat("MMMM d, yyyy");

  @override
  MovieFactsPageState build() {
    return const MovieFactsPageState();
  }

  void initWithMovie(Movie movie) {
    List<MovieFact> items = [];

    if (movie.status != null) {
      items.add(MovieFact(
        label: "Status",
        value: movie.status!,
      ));
    }

    if (movie.releaseDate != null) {
      items.add(
        MovieFact(
          label: "Release Date",
          value: _format.format(movie.releaseDate!),
        ),
      );
    }

    if (movie.originalLanguage != null) {
      items.add(
        MovieFact(
          label: "Original Language",
          value: movie.originalLanguage!,
        ),
      );
    }

    if (movie.runtime != null) {
      items.add(
        MovieFact(
          label: "Runtime",
          value: _formatRuntime(movie.runtime!),
        ),
      );
    }

    if (movie.budget != null) {
      items.add(
        MovieFact(
          label: "Budget",
          value: _formatMoney(movie.budget!),
        ),
      );
    }

    if (movie.revenue != null) {
      items.add(
        MovieFact(
          label: "Revenue",
          value: _formatMoney(movie.revenue!),
        ),
      );
    }
    state = state.copyWith(facts: items);
  }

  String _formatRuntime(int totalMinutes) {
    int hours = totalMinutes ~/ 60; // Integer division to get hours
    int minutes = totalMinutes % 60; // Remainder to get minutes
    return '${hours}h ${minutes}m';
  }

  String _formatMoney(int money) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 2,
    );
    return currencyFormatter.format(money);
  }
}
