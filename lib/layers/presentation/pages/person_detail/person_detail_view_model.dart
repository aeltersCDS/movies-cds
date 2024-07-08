import 'package:logger/logger.dart';
import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';
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
    state = state.copyWith(status: PageStatus.loading);
    try {
      final details = await ref.read(getPersonDetailsProvider)(personId);
      state = state.copyWith(
        status: PageStatus.success,
        person: state.person?.copyWith(biography: details.biography),
      );
    } catch (exc, stack) {
      Logger().e(exc, stackTrace: stack);
      state = state.copyWith(status: PageStatus.failure);
    }
  }

  void hideErrorDialog() {
    state = state.copyWith(status: PageStatus.success);
  }
}
