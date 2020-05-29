import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/question.dart';

class QuestionAddController extends ResourceController {
  QuestionAddController(this.context);

  final ManagedContext context;
//store
 @Operation.post()
Future<Response> createHero(@Bind.body(ignore: ["question_id"]) Question inputHero) async {
  final query = Query<Question>(context)
    ..values = inputHero;

  final insertedHero = await query.insert();

  return Response.ok(insertedHero);

//check
  @Operation.put('question_id')
  Future<Response> checkQuestions() async {
    return Response.ok("checkQuestions");
  }
}
}
