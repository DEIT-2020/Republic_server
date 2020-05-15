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
    .route("/heroes/[:id]")
    .link(() => HeroesController(context));

  router
    .route("/example")
    .linkFunction((request) async {
      return new Response.ok({"key": "value"});
  });

  return router;
}
}