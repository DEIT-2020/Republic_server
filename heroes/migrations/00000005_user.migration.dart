import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration5 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_appUser", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("uname", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("uemail", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("upassword", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final managerNames = ["A", "B", "C"];

    for (final managerName in managerNames) {
      await database.store.execute(
          "INSERT INTO _appUser (managerame) VALUES (@name)",
          substitutionValues: {"name": managerName});
    }
  }
}
