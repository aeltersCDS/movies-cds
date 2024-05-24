import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/domain/repository/person_repository.dart';

class GetTrendingPeople {
  GetTrendingPeople({
    required PersonRepository repository,
  }) : _repository = repository;

  final PersonRepository _repository;

  Future<List<Person>> call({int page = 0}) async {
    final list = await _repository.getTrendingPeople(page: page);
    return list;
  }
}
