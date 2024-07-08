import 'package:flutter/material.dart';
import 'package:movies_cds/layers/domain/model/cast_member.dart';
import 'package:movies_cds/layers/presentation/common/corner_clipper.dart';
import 'package:transparent_image/transparent_image.dart';

class CastMemberHorizontalListItem extends StatelessWidget {
  const CastMemberHorizontalListItem({super.key, required this.member});
  final CastMember member;

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
                final profileUrl = member.profileUrl;
                if (profileUrl != null) {
                  return FadeInImage.memoryNetwork(
                    image: profileUrl,
                    placeholder: kTransparentImage,
                    imageErrorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return _errorImage(context);
                    },
                    height: 144,
                    width: 120,
                    fit: BoxFit.cover,
                  );
                } else {
                  return _errorImage(context);
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                member.name,
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

  Widget _errorImage(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary.withAlpha(100),
      child: const SizedBox(
        height: 144,
        width: 120,
      ),
    );
  }
}
