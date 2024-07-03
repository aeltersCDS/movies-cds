import 'package:equatable/equatable.dart';
import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';

class PersonDetailPageState extends Equatable {
  const PersonDetailPageState({
    this.status = PageStatus.initial,
    this.person,
  });

  final PageStatus status;
  final Person? person;

  PersonDetailPageState copyWith({
    PageStatus? status,
    Person? person,
  }) {
    return PersonDetailPageState(
      status: status ?? this.status,
      person: person ?? this.person,
    );
  }

  @override
  List<Object?> get props => [status, person];
}
