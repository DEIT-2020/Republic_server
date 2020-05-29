import 'package:heroes/heroes.dart';


class Manager extends ManagedObject<_Manager> implements _Manager {}
class _Manager {
  @primaryKey
  int manager_id;

  @Column(unique: true)
  String manager_name;

  @Column(unique: true)
  String manager_password;
}