import 'package:heroes/heroes.dart';

class appUser extends ManagedObject<_appUser> implements _appUser {}

class _appUser {
  @primaryKey
  int id;

  @Column(unique: true)
  String uname;

  @Column(unique: true)
  String uemail;

  @Column(unique: true)
  String upassword;
}
