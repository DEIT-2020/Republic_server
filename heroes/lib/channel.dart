import 'heroes.dart';
import 'controller/heroes_controller.dart';
import 'package:aqueduct/managed_auth.dart';
import 'package:heroes/model/user.dart';
import 'package:heroes/model/manager.dart';
import 'package:heroes/model/question.dart';
import 'package:heroes/controller/register_controller.dart';
import 'package:heroes/controller/managerLogin_controller.dart';
import 'package:heroes/controller/questionCheck_controller.dart';
import 'package:heroes/controller/questionAdd_controller.dart';
import 'package:heroes/controller/appuserLogin_controller.dart';
import 'package:heroes/controller/mainInterface_percenter_controller.dart';
import 'package:heroes/controller/mainInterface_controller.dart';
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
   router
    .route('/auth/token')
    .link(() => AuthController(authServer));

    router
    .route('/heroes/[:id]')
    .link(() => HeroesController(context));

  router
    .route('/register')
    .link(() => RegisterController(context, authServer));

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
<<<<<<< HEAD

=======
=======
   router
    .route('/register')
    .link(() => RegisterController(context, authServer));

     //login
   router
    .route("/login/manager")
    .link(() => ManagerController(context));

      //question
   router
    .route('/questionCheck')
    .link(() => QuestionCheckController(context));

    router
    .route("/questionCheck/[:id]")
    .link(() => QuestionCheckController(context));

   router
    .route('/questionAdd')
    .link(() => QuestionAddController(context));

<<<<<<< HEAD
>>>>>>> JinYiXuan
   router
   .route("/login/appUser");
   .link(()=> AppUserController(context));
   router
   .route("/appUserinfo/[:id]")
   .link(()=> appuserinfoController(context));
   router
   .route("/home");
   .link(()=> homeController(context));
   router
   .route("percenter/[:id]");
   .link(()=> home_percenterController(context));
>>>>>>> 23f6be9e5bf84e61256495606e08bb8d42c35701
=======
>>>>>>> JinYiXuan
  return router;
  
}
}


class HeroConfig extends Configuration {
  HeroConfig(String path): super.fromFile(File(path));
  DatabaseConfiguration database;
}