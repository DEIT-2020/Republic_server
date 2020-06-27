import 'heroes.dart';
import 'controller/heroes_controller.dart';
import 'package:aqueduct/managed_auth.dart';
import 'package:heroes/model/user.dart';
import 'package:heroes/model/manager.dart';
/*import 'package:heroes/model/question.dart';*/
import 'package:heroes/controller/register_controller.dart';
import 'package:heroes/controller/managerLogin_controller.dart';
import 'package:heroes/controller/questionCheck_controller.dart';
import 'package:heroes/controller/questionAdd_controller.dart';
import 'package:heroes/controller/appuser_controller.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class HeroesChannel extends ApplicationChannel {
  ManagedContext context;

  AuthServer authServer;
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = HeroConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, persistentStore);

    final authStorageu = ManagedAuthDelegate<User>(context, tokenLimit: 20);
    authServer = AuthServer(authStorageu);
  }

  @override
  Controller get entryPoint {
    final router = Router();
    router.route('/auth/token').link(() => AuthController(authServer));

    router.route('/heroes/[:id]').link(() => HeroesController(context));

    router
        .route('/register/user')
        .link(() => RegisterController(context, authServer));

    //login
    // router.route("/login/manager").link(() => ManagerController(context));

    //question
    /* router
    .route('/questionCheck')
    .link(() => QuestionCheckController(context));*/

    router
        .route("/questionCheck/[:id]")
        .link(() => Authorizer.bearer(authServer))
        .link(() => QuestionCheckController(context));

    router
        .route('/questionAdd')
        .link(() => Authorizer.bearer(authServer))
        .link(() => QuestionAddController(context));
    router
        .route("/home/game")
        .link(() => Authorizer.bearer(authServer))
        .linkFunction((request) async {
      return Response.ok(200);
    });
    router.route("/login/appUser").link(() => AppUserController(context));

    return router;
  }
}

class HeroConfig extends Configuration {
  HeroConfig(String path) : super.fromFile(File(path));
  DatabaseConfiguration database;
}
