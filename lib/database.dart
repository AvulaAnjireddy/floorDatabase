import 'dart:async';

import 'package:flooorexample/dao_object.dart';
import 'package:flooorexample/personmodel.dart';
import 'package:floor/floor.dart';



@Database(version: 1, entities: [Person])
abstract class PersonDataBase extends FloorDatabase{
  PersonDao get personDao;
}