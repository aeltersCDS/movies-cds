import 'package:movies_cds/layers/domain/model/person.dart';
import 'package:movies_cds/layers/domain/repository/person_repository.dart';

class GetPersonDetails {
  GetPersonDetails({
    required PersonRepository repository,
  }) : _repository = repository;

  final PersonRepository _repository;

  Future<Person> call(int personId) async {
    return await _repository.getPersonDetails(personId);
  }
}
