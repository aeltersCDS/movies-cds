import 'package:equatable/equatable.dart';

class CastMember with EquatableMixin {
  CastMember({
    required this.id,
    required this.name,
    required this.character,
    required this.profileUrl,
  });

  int id;
  String name;
  String character;
  String? profileUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        character,
        profileUrl,
      ];
}
