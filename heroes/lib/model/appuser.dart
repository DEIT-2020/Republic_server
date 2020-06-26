import 'package:heroes/heroes.dart';

class AppUser extends ManagedObject<_AppUser> implements _AppUser {}

class _AppUser{
  @primaryKey
  int id;

  @Column(unique:true)
  String uname;

  @Column(unique:true)
  String upassword;
}