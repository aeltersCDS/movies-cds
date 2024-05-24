import 'package:flutter/material.dart';
import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/presentation/common/corner_clipper.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonListItem extends StatelessWidget {
  const PersonListItem({super.key, required this.person});
  final Person person;

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
              roundedCorners: {Corner.topLeft, Corner.bottomLeft},
            ),
            child: Builder(builder: (context) {
              final profileUrl = person.profileUrl;
              if (profileUrl != null) {
                return FadeInImage.memoryNetwork(
                  image: profileUrl,
                  placeholder: kTransparentImage,
                  height: 96,
                  width: 96,
                  fit: BoxFit.cover,
                );
              } else {
                return Container(
                  color: Theme.of(context).colorScheme.primary.withAlpha(100),
                  child: const SizedBox(
                    width: 96,
                    height: 96,
                  ),
                );
              }
            }),
          ),
          Expanded(
              child: SizedBox(
            height: 96,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                      child: LayoutBuilder(
                    builder: (context, constraints) => RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(200)),
                        children: [
                          const TextSpan(
                              text: "Known for: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: person.knownFor
                                  .map((movie) => movie.title)
                                  .join(","))
                        ],
                      ),
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
