import 'package:equatable/equatable.dart';

class MovieFactsPageState extends Equatable {
  const MovieFactsPageState({this.facts});

  final List<MovieFact>? facts;

  MovieFactsPageState copyWith({
    List<MovieFact>? facts,
  }) {
    return MovieFactsPageState(
      facts: facts ?? this.facts,
    );
  }

  @override
  List<Object?> get props => [facts];
}

class MovieFact extends Equatable {
  const MovieFact({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  List<Object?> get props => [label, value];
}
