import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/presentation/pages/person_detail/person_detail_page_state.dart';
import 'package:movies_cds/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person_detail_view_model.g.dart';

@riverpod
class PersonDetailViewModel extends _$PersonDetailViewModel {
  @override
  PersonDetailPageState build() {
    return const PersonDetailPageState();
  }

  void initWithPerson(Person person) {
    state = state.copyWith(person: person);
    _loadDetails(person.id);
  }

  void _loadDetails(int personId) async {
    final details = await ref.read(getPersonDetailsProvider)(personId);
    state = state.copyWith(
      person: state.person?.copyWith(biography: details.biography),
    );
  }
}
