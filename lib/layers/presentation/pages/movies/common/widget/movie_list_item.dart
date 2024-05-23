import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/common/corner_clipper.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieListItem extends StatelessWidget {
  MovieListItem({super.key, required this.movie});
  final Movie movie;
  final DateFormat _format = DateFormat("MMMM d, yyyy");

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          ClipPath(
            clipper: CornerClipper(
                borderRadius: 15.0,
                roundedCorners: {Corner.topLeft, Corner.bottomLeft}),
            child: FadeInImage.memoryNetwork(
              image: "https://image.tmdb.org/t/p/original/${movie.posterPath}",
              placeholder: kTransparentImage,
              height: 200,
              width: 133.33,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Column(
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _format.format(movie.releaseDate),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Flexible(
                      child: LayoutBuilder(
                    builder: (context, constraints) => Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: constraints.maxHeight ~/ 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
