import 'package:equatable/equatable.dart';

class MovieFactsPageState extends Equatable {
  const MovieFactsPageState({
    this.status,
    this.releaseDate,
    this.originalLanguage,
    this.runtime,
    this.budget,
    this.revenue,
  });

  final String? status;
  final DateTime? releaseDate;
  final String? originalLanguage;
  final int? runtime;
  final int? budget;
  final int? revenue;

  MovieFactsPageState copyWith({
    String? status,
    DateTime? releaseDate,
    String? originalLanguage,
    int? runtime,
    int? budget,
    int? revenue,
  }) {
    return MovieFactsPageState(
      status: status ?? this.status,
      releaseDate: releaseDate ?? this.releaseDate,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      runtime: runtime ?? this.runtime,
      budget: budget ?? this.budget,
      revenue: revenue ?? this.revenue,
    );
  }

  @override
  List<Object?> get props =>
      [status, releaseDate, originalLanguage, runtime, budget, revenue];
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
