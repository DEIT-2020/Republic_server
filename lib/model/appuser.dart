import 'package:heroes/heroes.dart';

class Appuser extends ManagedObject<_Appuser> implements _Appuser {}

class _Appuser {
@primaryKey
  int appuser_id;

  @Column(unique: true)
  String appuser_name;

  @Column(unique: true)
  String appuser_password;
}