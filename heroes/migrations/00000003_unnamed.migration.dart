import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration3 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Manager", [SchemaColumn("managerId", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("managerName", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("managerPassword", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true)]));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed(
  ) async {
    final managerNames = ["JIN", "CHENG", "HE"];

  for (final managerName in managerNames) {    
    await database.store.execute("INSERT INTO _Manager (managerame) VALUES (@name)", substitutionValues: {
      "name": managerName
    });
  }
  }
}
    