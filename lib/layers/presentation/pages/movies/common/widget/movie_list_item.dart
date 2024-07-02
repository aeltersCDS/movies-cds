import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/common/corner_clipper.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieListItem extends StatelessWidget {
  MovieListItem({super.key, required this.movie, required this.onTap});
  final Movie movie;
  final DateFormat _format = DateFormat("MMMM d, yyyy");
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            ClipPath(
              clipper: CornerClipper(
                borderRadius: 15.0,
                roundedCorners: {Corner.topLeft, Corner.bottomLeft},
              ),
              child: Builder(builder: (context) {
                final prosterUrl = movie.posterUrl;
                if (prosterUrl != null) {
                  return FadeInImage.memoryNetwork(
                    image: prosterUrl,
                    placeholder: kTransparentImage,
                    height: 200,
                    width: 133.33,
                    fit: BoxFit.fill,
                  );
                } else {
                  return Container(
                    color: Theme.of(context).colorScheme.primary.withAlpha(100),
                    child: const SizedBox(
                      height: 200,
                      width: 133.33,
                    ),
                  );
                }
              }),
            ),
            Expanded(
                child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      movie.releaseDate != null
                          ? _format.format(movie.releaseDate!)
                          : "",
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
      ),
    );
  }
}
