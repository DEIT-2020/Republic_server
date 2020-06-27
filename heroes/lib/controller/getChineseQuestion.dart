import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/question.dart';
import 'dart:math';

class ChineseQuestionController extends ResourceController {
  ChineseQuestionController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getChineseQuestions(
      {@Bind.query('questionContent') String questionId}) async {
    final query = Query<Question>(context); //拿到表的查询实例
    final List<Question> questions = await query.fetch();
    final qb= List<dynamic>(10);

    for (var i = 0; i < 10; i++) {
      if (questions.length == 0) break;
      var random = Random();
      var ran = random.nextInt(questions.length);
      if (questions[ran]['questionSubject'] == "Chinese") {
        //等checkby
        qb[i] = {'question':questions[ran]['questionContent'],'answer': questions[ran]['answer']};
 
        questions.remove(questions[ran]);
      } else {
        questions.remove(questions[ran]);
        i--;
      }
    } 

    return Response.ok(qb);
  }
}
