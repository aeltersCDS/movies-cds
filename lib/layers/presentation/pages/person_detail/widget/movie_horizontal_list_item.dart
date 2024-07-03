import 'package:flutter/material.dart';
import 'package:movies_cds/layers/domain/model/movie.dart';
import 'package:movies_cds/layers/presentation/common/corner_clipper.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieHorizontalListItem extends StatelessWidget {
  const MovieHorizontalListItem({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            ClipPath(
              clipper: CornerClipper(
                borderRadius: 15.0,
                roundedCorners: {
                  Corner.topLeft,
                  Corner.topRight,
                },
              ),
              child: Builder(builder: (context) {
                final posterUrl = movie.posterUrl;
                if (posterUrl != null) {
                  return FadeInImage.memoryNetwork(
                    image: posterUrl,
                    placeholder: kTransparentImage,
                    height: 144,
                    width: 120,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Container(
                    color: Theme.of(context).colorScheme.primary.withAlpha(100),
                    child: const SizedBox(
                      height: 144,
                      width: 120,
                    ),
                  );
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                movie.title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
