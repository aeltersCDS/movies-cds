import 'package:logger/logger.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';
import 'package:movies_cds/layers/presentation/pages/people/people_page_state.dart';
import 'package:movies_cds/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'people_view_model.g.dart';

@riverpod
class PeopleViewModel extends _$PeopleViewModel {
  @override
  PeoplePageState build() {
    return const PeoplePageState();
  }

  Future<void> fetchNextPage() async {
    if (state.hasReachedEnd || state.status == PageStatus.loading) return;
    state = state.copyWith(status: PageStatus.loading);
    try {
      final page =
          await ref.read(getTrendingPeopleProvider)(page: state.currentPage);
      state = state.copyWith(
        status: PageStatus.success,
        currentPage: state.currentPage + 1,
        people: List.of(state.people)..addAll(page),
        hasReachedEnd: page.isEmpty,
      );
    } catch (exc, stack) {
      Logger().e(exc, stackTrace: stack);
      state = state.copyWith(status: PageStatus.failure);
    }
  }
}
