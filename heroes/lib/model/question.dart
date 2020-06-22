import 'package:heroes/heroes.dart';


class Question extends ManagedObject<_Question> implements _Question {}
class _Question {
  @primaryKey
  int questionId;
  
  @Column(unique: false)
  String questionSubject;

  @Column(unique: false)
  String questionContent;

  @Column(unique: false)
  String answer;
}