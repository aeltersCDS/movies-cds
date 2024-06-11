import 'package:flutter/material.dart';
import 'package:movies_cds/layers/domain/model/crew_member.dart';
import 'package:movies_cds/layers/presentation/pages/movie_cast_crew/widget/movie_member_list_item.dart';

class CrewTab extends StatefulWidget {
  const CrewTab({
    super.key,
    required this.crew,
  });

  final List<CrewMember>? crew;

  @override
  State<CrewTab> createState() => _CrewTabState();
}

class _CrewTabState extends State<CrewTab> with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(height: 4.0),
      itemCount: widget.crew?.length ?? 0,
      itemBuilder: (context, index) {
        final member = widget.crew![index];
        return MovieMemberListItem(
          name: member.name,
          title: member.job,
          profileUrl: member.profileUrl,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
