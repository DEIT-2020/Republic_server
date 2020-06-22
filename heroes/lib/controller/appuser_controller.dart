import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/appUser.dart';

class AppUserController extends ResourceController {
  AppUserController(this.context);

  final ManagedContext context;

  @Operation.get('Uid') //按表名搜索用户id登录
  Future<Response> getUserbyUID(@Bind.path('uid') int uid) async {
    final userQuery = Query<appUser>(context)..where((u) => u.id).equalTo(uid);
    final user = await userQuery.fetchOne();
    if (user == null) {
      return Response.notFound();
    } else {
      return Response.ok(user);
    }

    @Operation.post()
    Future<Response> userregister(@Bind.body() appUser appUserregister) async {
      final postquery = Query<appUser>(context)..values = appUserregister;
      final insertedUser = await postquery.insert();
      return Response.ok(insertedUser);
    }

    @Operation.put('uid')
    Future<Response> updatepreUser(
        @Bind.path('uid') int uid, @Bind.body() appUser user) async {
      final query = Query<appUser>(context)
        ..where((u) => u.id).equalTo(uid)
        ..values = user;

      return Response.ok(await query.updateOne());
    }
  }
}
