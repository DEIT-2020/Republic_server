import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/manager.dart';

class ManagerController extends ResourceController {

  ManagerController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> checkmanager(
      @Bind.body(ignore: ["managerId"]) Manager inputManager,
      @Bind.path('managerId') int managerId) async {
    final inputQuery = Query<Manager>(context)..values = inputManager;
   final outputQuery = Query<Manager>(context)
    ..where((h) => h.managerId).equalTo(managerId);    

  final manager = await outputQuery.fetchOne();
if (inputManager.managerId == manager.managerId &&
inputManager.managerPassword == manager.managerPassword)
    {
      return Response.ok(manager);
    }
    else {
      return Response.notFound();
    }
      }
      }