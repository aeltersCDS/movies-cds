import 'package:equatable/equatable.dart';

class CrewMember with EquatableMixin {
  CrewMember({
    required this.id,
    required this.name,
    required this.job,
    required this.profileUrl,
  });

  int id;
  String name;
  String job;
  String? profileUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        job,
        profileUrl,
      ];
}
