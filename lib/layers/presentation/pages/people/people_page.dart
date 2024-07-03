import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';
import 'package:movies_cds/layers/presentation/common/widget/list_loading_item.dart';
import 'package:movies_cds/layers/presentation/pages/people/people_view_model.dart';
import 'package:movies_cds/layers/presentation/pages/people/widget/person_list_item.dart';
import 'package:go_router/go_router.dart';

class PeoplePage extends ConsumerStatefulWidget {
  const PeoplePage({super.key});

  @override
  ConsumerState<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends ConsumerState<PeoplePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(peopleViewModelProvider.notifier).fetchNextPage();
    });
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(peopleViewModelProvider);
    final list = state.people;
    final status = state.status;
    final hasEnded = state.hasReachedEnd;
    return Column(
      children: [
        AppBar(
          title: const Text("People"),
          centerTitle: true,
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              if (status == PageStatus.initial || list.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 4.0),
                  itemCount: hasEnded ? list.length : list.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= list.length) {
                      return !hasEnded
                          ? const ListLoadingItem()
                          : const SizedBox();
                    }
                    final person = list[index];
                    return PersonListItem(
                        person: person, onTap: () => _goToPersonDetail(person));
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  void _onScroll() {
    if (_isBottom) {
      ref.read(peopleViewModelProvider.notifier).fetchNextPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _goToPersonDetail(Person person) {
    context.pushNamed(
      "person_detail",
      extra: person,
    );
  }
}
