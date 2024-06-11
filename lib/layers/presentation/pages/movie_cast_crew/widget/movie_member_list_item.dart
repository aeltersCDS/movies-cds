import 'package:flutter/material.dart';
import 'package:movies_cds/layers/presentation/common/corner_clipper.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieMemberListItem extends StatelessWidget {
  const MovieMemberListItem(
      {super.key,
      required this.name,
      required this.title,
      required this.profileUrl});
  final String name;
  final String title;
  final String? profileUrl;

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
              if (profileUrl != null) {
                return FadeInImage.memoryNetwork(
                  image: profileUrl!,
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
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(200)),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
