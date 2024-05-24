import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';

class PeoplePageState extends Equatable {
  const PeoplePageState({
    this.status = PageStatus.initial,
    this.people = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  final PageStatus status;
  final List<Person> people;
  final bool hasReachedEnd;
  final int currentPage;

  PeoplePageState copyWith({
    PageStatus? status,
    List<Person>? people,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return PeoplePageState(
      status: status ?? this.status,
      people: people ?? this.people,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
        status,
        people,
        hasReachedEnd,
        currentPage,
      ];
}
