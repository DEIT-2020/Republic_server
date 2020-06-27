import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/question.dart';

class QuestionCheckController extends ResourceController {
  QuestionCheckController(this.context);

  final ManagedContext context;

//get
  @Operation.get()
Future<Response> getAllQuestions({@Bind.query('questionContent') String questionId}) async {
  final questionQuery = Query<Question>(context);
  if (questionId != null) {
    questionQuery.where((h) => h.questionContent).contains(questionId, caseSensitive: false);
  }
  final questions = await questionQuery.fetch();

  return Response.ok(questions);
}

@Operation.get('questionId')
  Future<Response> getQuestionById(@Bind.path('questionId') int questionid) async {
//根据id查询一条数据
    final query = Query<Question>(context)..where((h) => h.questionId).equalTo(questionid);
    final question = await query.fetchOne();
     if (question == null) {
    return Response.notFound();
  }
  return Response.ok(question);
}

/*check
  @Operation.put('question_id')
  Future<Response> checkQuestions() async {
    return Response.ok("checkQuestions");
  }*/

//delete
 @Operation.delete('questionId')
  Future<Response> deleteArticleById(@Bind.path('questionId') int id) async {
    final query = Query<Question>(context)..where((a) => a.questionId).equalTo(id);
//删除一条数据
    final result = await query.delete();
    if (result != null && result == 1) {
      return Response.ok("删除成功");
    } else {
      return Response.ok("删除失败，数据不存在");
    }
  }

  @Operation.delete()
  Future<Response> deleteQuestion(@Bind.body() int question) async {
  final deletequery = Query<Question>(context)
    ..where((q) => q.questionId).equalTo(question);
  await deletequery.delete();
    return Response.ok("删除成功");
  }
}