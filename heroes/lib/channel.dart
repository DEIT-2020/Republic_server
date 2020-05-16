import 'heroes.dart';
import 'controller/heroes_controller.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class HeroesChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      "heroes_user", "password", "localhost", 5432, "heroes");

    context = ManagedContext(dataModel, persistentStore);
  }
  
  @override
Controller get entryPoint {
  final router = Router();

  router
        .route('/mainUI/[:funcnum]')
        .link(() => UIController())
//        .linkFunction((request) async {
//      return Response.ok({'data': '123'});
//    });
        .link(()=>succeedController())


 router
  .route('userlogin')
  .link(()=> userloginController(context));

router
  .route('managerlogin')
  .link(()=> managerlogincheckController(context));

  return router;
}
}