import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/question.dart';

class QuestionCheckController extends ResourceController {
  QuestionCheckController(this.context);

  final ManagedContext context;

//get
  @Operation.get()
  Future<Response> getTopQuestions() async {
    return Response.ok("getTopQuestions");
  }

@Operation.get('question_id')
  Future<Response> getArticleById(@Bind.path('question_id') int id) async {
//根据id查询一条数据
    final query = Query<Question>(context)..where((a) => a.question_id).equalTo(id);
    final article = await query.fetchOne();
    if (article != null) {
      return Response.ok(Question);
    } else {
      return Response.notFound();
    }
  }

//check
  @Operation.put('question_id')
  Future<Response> checkQuestions() async {
    return Response.ok("checkQuestions");
  }

//delete
 @Operation.delete('question_id')
  Future<Response> deleteArticleById(@Bind.path('question_id') int id) async {
    final query = Query<Question>(context)..where((a) => a.question_id).equalTo(id);
//删除一条数据
    final result = await query.delete();
    if (result != null && result == 1) {
      return Response.ok("删除成功");
    } else {
      return Response.ok("删除失败，数据不存在");
    }
  }
}