import 'package:heroes/heroes.dart';

<<<<<<< HEAD
class Manager extends ManagedObject<_Manager> implements _Manager {}
class _Manager {

=======

class Manager extends ManagedObject<_Manager> implements _Manager {}
class _Manager {
>>>>>>> JinYiXuan
  @primaryKey
  int manager_id;

  @Column(unique: true)
  String manager_name;

  @Column(unique: true)
  String manager_password;
<<<<<<< HEAD

=======
>>>>>>> JinYiXuan
}