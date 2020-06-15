import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/question.dart';

class QuestionAddController extends ResourceController {
  QuestionAddController(this.context);

  final ManagedContext context;
//store
 @Operation.post()
Future<Response> createHero(@Bind.body(ignore: ["question_id"]) Question inputQuestion) async {
  final query = Query<Question>(context)
    ..values = inputQuestion;

  final insertedQuestion = await query.insert();

  return Response.ok(insertedQuestion);

//check
  @Operation.put('question_id')
  Future<Response> checkQuestions() async {
    return Response.ok("checkQuestions");
  }
}
}
