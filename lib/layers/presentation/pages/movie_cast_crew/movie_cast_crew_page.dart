import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/domain/model/movie_credits.dart';
import 'package:movies_cds/layers/presentation/pages/movie_cast_crew/movie_cast_crew_view_model.dart';
import 'package:movies_cds/layers/presentation/pages/movie_cast_crew/widget/cast_tab.dart';
import 'package:movies_cds/layers/presentation/pages/movie_cast_crew/widget/crew_tab.dart';

class MovieCastCrewData {
  MovieCastCrewData({
    required this.movie,
    required this.credits,
  });

  Movie movie;
  MovieCredits credits;
}

class MovieCastCrewPage extends ConsumerStatefulWidget {
  const MovieCastCrewPage({required this.data, super.key});
  final MovieCastCrewData data;

  @override
  ConsumerState<MovieCastCrewPage> createState() => _MovieCastCrewPageState();
}

class _MovieCastCrewPageState extends ConsumerState<MovieCastCrewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(movieCastCrewViewModelProvider.notifier)
          .initWithData(widget.data);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(movieCastCrewViewModelProvider);
    final title = state.title;
    final cast = state.cast;
    final crew = state.crew;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: "Cast"),
                Tab(text: "Crew"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CastTab(cast: cast),
                CrewTab(crew: crew),
              ],
            ),
          )
        ],
      ),
    );
  }
}
