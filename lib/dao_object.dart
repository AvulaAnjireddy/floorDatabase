// dao/person_dao.dart

import 'package:flooorexample/personmodel.dart';
import 'package:floor/floor.dart';
@dao
abstract class PersonDao {
  @Query('SELECT *FROM Person')
  Future<List<Person>> findAllPersons();

  @insert
  Future<void> insertPerson(Person person);

  @Query('DELETE FROM Person WHERE id=:id')
  Future<Person> deleteAllPersons(int id);

  @update
  Future<int> updatePersons( Person person);
}