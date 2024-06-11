import 'package:flutter/material.dart';
import 'package:movies_cds/layers/domain/model/cast_member.dart';
import 'package:movies_cds/layers/presentation/pages/movie_cast_crew/widget/movie_member_list_item.dart';

class CastTab extends StatefulWidget {
  const CastTab({
    super.key,
    required this.cast,
  });

  final List<CastMember>? cast;

  @override
  State<CastTab> createState() => _CastTabState();
}

class _CastTabState extends State<CastTab> with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const SizedBox(height: 4.0),
      itemCount: widget.cast?.length ?? 0,
      itemBuilder: (context, index) {
        final member = widget.cast![index];
        return MovieMemberListItem(
          name: member.name,
          title: member.character,
          profileUrl: member.profileUrl,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
