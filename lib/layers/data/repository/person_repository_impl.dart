import 'package:movies_cds/layers/data/source/remote/api.dart';
import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  final Api _api;

  PersonRepositoryImpl({required Api api}) : _api = api;

  @override
  Future<List<Person>> getTrendingPeople({int page = 1}) async {
    final people = await _api.loadTrendingPeople(page: page);
    return people.map((person) => person.toDomain()).toList();
  }

  @override
  Future<Person> getPersonDetails(int personId) async {
    final person = await _api.loadPersonDetails(personId);
    return person.toDomain();
  }
}
