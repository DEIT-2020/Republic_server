import 'package:heroes/heroes.dart';


class Question extends ManagedObject<_Question> implements _Question {}
class _Question {
  @primaryKey
  int question_id;
  String question_subject;

  @Column(unique: true)
  String question_content;

  @Column(unique: false)
  String answer;
}

