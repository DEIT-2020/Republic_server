import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/manager.dart';
import 'package:heroes/model/base_result.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart' as res;
import 'dart:convert';

class ManagerController extends ResourceController {

  ManagerController(this.context);

  final ManagedContext context;

  @Operation.post()
 Future<Response> login(@Bind.body() Manager manager) async {
    String msg = "登录异常";
    //查询数据库是否存在这个用户
    var query = Query<Manager>(context)

      ..where((u) => u.managerId).equalTo(manager.managerId);
    Manager result = await query.fetchOne();

    if (result == null) {
      msg = "管理员不存在";
    } else {
      //通过auth/token获取token。登录成功的话，返回token
      var clientId = "com.donggua.chat";
      var clientSecret = "dongguasecret";
      var body =
          "managerName=${manager.managerId}&password=${manager.managerPassword}&grant_type=password";
      var clientCredentials =
          Base64Encoder().convert("$clientId:$clientSecret".codeUnits);

      res.Response response =
          await http.post('http://localhost:8888/auth/token',
              headers: {
                "Content-Type": "application/x-www-form-urlencoded",
                "Authorization": "Basic $clientCredentials"
              },
              body: body);

      if (response.statusCode == 200) {
        var map = json.decode(response.body);

        return Response.ok(
          BaseResult(
            code: 1,
            msg: "登录成功",
            data: {
              'managerId': result.managerId,
              'access_token': map['access_token'],
              'managerName': result.managerName
            },
          ),
        );
      }
    }
    return Response.ok(
      BaseResult(
        code: 1,
        msg: msg,
      ),
    );
  }
}