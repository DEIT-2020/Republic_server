import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/manager.dart';

class ManagerController extends ResourceController {

  ManagerController(this.context);

  final ManagedContext context;

  @Operation.get('managerId')
  Future<Response> getUser() async {
    return Response.ok("登陆成功");
  }
}