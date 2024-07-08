import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_cds/layers/presentation/common/page_status.dart';
import 'package:movies_cds/layers/presentation/common/widget/dialog.dart';
import 'package:movies_cds/layers/presentation/pages/person_detail/person_detail_view_model.dart';
import 'package:movies_cds/layers/presentation/pages/person_detail/widget/movie_horizontal_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonDetailPage extends ConsumerStatefulWidget {
  const PersonDetailPage({super.key, required this.person});
  final Person person;

  @override
  ConsumerState<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends ConsumerState<PersonDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(personDetailViewModelProvider.notifier)
          .initWithPerson(widget.person);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final state = ref.watch(personDetailViewModelProvider);
    final status = state.status;
    final person = state.person;
    final knownFor = person?.knownFor ?? [];
    final biography = person?.biography;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const horizontalPadding = EdgeInsets.fromLTRB(16, 0, 16, 0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (status == PageStatus.failure) {
        tmdbErrorDialog(
          context: context,
          onButtonTap: () {
            ref.read(personDetailViewModelProvider.notifier).hideErrorDialog();
          },
        );
      }
    });
    return Container(
      color: colorScheme.surface,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              ),
              floating: false,
              pinned: true,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.network(
                  person?.profileUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: horizontalPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        person?.name ?? "",
                        style: textTheme.displaySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _goToPersonalInfo(person),
                      icon: const Icon(Icons.info_outline),
                      color: colorScheme.secondary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Builder(
                builder: (context) {
                  if (knownFor.isEmpty) return const SizedBox();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: horizontalPadding,
                        child: Text(
                          localizations.knownFor,
                          style: textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 190,
                        child: ListView.separated(
                          padding: horizontalPadding,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MovieHorizontalListItem(
                              movie: knownFor[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 16.0),
                          itemCount: knownFor.length,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  );
                },
              ),
              Builder(
                builder: (context) {
                  if (biography == null || biography.isEmpty) {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: horizontalPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizations.biography,
                          style: textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          biography,
                          style: textTheme.bodyMedium,
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _goToPersonalInfo(Person? person) {}
}
