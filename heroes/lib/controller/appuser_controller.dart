import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/AppUser.dart';
import 'package:heroes/model/AppUser.dart' as prefix0;
import 'package:heroes/model/user.dart';

class AppUserController extends ResourceController {
  AppUserController(this.context);

  final ManagedContext context;

@Operation.get()
  Future<Response> getAllusers({@Bind.query('name') String name}) async {

    final userQuery = Query<AppUser>(context);
    if (name != null) {
      userQuery.where((h) => h.id).contains(name, caseSensitive: false);
    }
    final user = await userQuery.fetch();

    return Response.ok(user);
  }
@Operation.get('id')
  Future<Response> getUserByID(@Bind.path('id') int id) async {
  final userQuery = Query<AppUser>(context)
    ..where((u) => u.id).equalTo(id);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句

  final user = await userQuery.fetchOne();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 

  if (user == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(user);
    }
  }
 
    @Operation.post()
    Future<Response> userregister(@Bind.body() AppUser appUserregister) async {
      final appUser = AppUser()
        ..read(await request.body.decode(), ignore: ["id"]);
      final query = Query<AppUser>(context)..values = appUser;
      final insertedappUser = await query.insert();
      return Response.ok(insertedappUser);
    }
  }
