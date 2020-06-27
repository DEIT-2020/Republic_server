import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/AppUser.dart';
import 'package:heroes/model/AppUser.dart' as prefix0;
import 'package:heroes/model/user.dart';

class AppUserController extends ResourceController {
  AppUserController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> checkuserid(
      @Bind.body User checkuser) async {
    final query = Query<Question>(context)..values = inputQuestion;

    final insertedQuestion = await query.insert();

    return Response.ok(insertedQuestion);}
}
