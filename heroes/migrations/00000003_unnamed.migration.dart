import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/model/question.dart';   

class Migration3 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Manager", [SchemaColumn("manager_id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("manager_name", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("manager_password", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true)]));
		database.createTable(SchemaTable("_Question", [SchemaColumn("question_id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("question_subject", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("question_content", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("answer", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
  database.addColumn("_Question", SchemaColumn.relationship("checkby", ManagedPropertyType.bigInteger, relatedTableName: "_Manager", relatedColumnName: "manager_id", rule: DeleteRule.cascade, isNullable: false, isUnique: false));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {
    final question_subjects =["语文","数学"];
     final question_contents=["行到水穷处","1+1="];
     final answers =["坐看云起时",2];
      for (final question_subject in question_subjects) {    
        await database.store.execute("INSERT INTO _question (question_subject) VALUES (@question_subject)", substitutionValues: {
          "question_subject": question_subject
        });
      }
      for (final question_content in question_contents) {    
        await database.store.execute("INSERT INTO _question (question_content) VALUES (@question_content)", substitutionValues: {
          "question_content": question_content
        });
      }
      for (final answer in answers) {    
        await database.store.execute("INSERT INTO _question (answer) VALUES (@answer)", substitutionValues: {
          "answer": answer
        });
      }
  }
}
    