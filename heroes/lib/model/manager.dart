import 'package:heroes/heroes.dart';


class Manager extends ManagedObject<_Manager> implements _Manager {}
class _Manager {
  @primaryKey
  int managerId;

  @Column(unique: true)
  String managerName;

  @Column(unique: true)
  String managerPassword;
}