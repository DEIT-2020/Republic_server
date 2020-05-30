import 'heroes.dart';
//import 'controller/heroes_controller.dart';
import 'package:aqueduct/managed_auth.dart';
import 'package:heroes/model/user.dart';
//import 'package:heroes/controller/register_controller.dart';
import 'package:heroes/controller/gameCenter.dart';
import 'package:heroes/controller/ballonStart.dart';


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

    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
  }

  @override
  Controller get entryPoint {
    final router = Router();
/*       router
    .route('/auth/token')
    .link(() => AuthController(authServer));
 */

    router.route('/gameInfo').link(() => gameController());

    router.route('/gameStart').link(() => ballonGameStart());
//new

//new;//link一个function
/* 
    router.route('/heroes/[:id]').link(() => HeroesController(context));

    router
        .route('/register')
        .link(() => RegisterController(context, authServer));
 */
    /*router
        .route('/mainUI/[:funcnum]')
        .link(() => UIController())
//        .linkFunction((request) async {
//      return Response.ok({'data': '123'});
//    });
        .link(()=>succeedController())


 router
  .route('/userlogin')
  .link(()=> userloginController(context));

router
  .route('/managerlogin')
  .link(()=> managerlogincheckController(context));*/

    return router;
  }
}

class HeroConfig extends Configuration {
  HeroConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}
