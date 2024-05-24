import 'package:movies_cds/layers/domain/model/person.dart';

abstract class PersonRepository {
  Future<List<Person>> getTrendingPeople({int page = 1});
}
