import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/appuser.dart';

class AppUserController extends ResourceController {

  AppUserController(this.context);

  final ManagedContext context;

  @Operation.get('user_id')
  Future<Response> getUserbyID() async {
    return Response.ok("登陆成功");
  }
}