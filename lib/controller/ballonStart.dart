import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';
import 'dart:io';
import 'package:http_server/http_server.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:angel_proxy/angel_proxy.dart';
import 'package:angel_static/angel_static.dart';
import 'package:file/local.dart';
import 'package:heroes/model/user.dart';

class ballonGameStart extends ResourceController {


  @Operation.get()
  Future<Response> showGameInfo() async {

    //启动gameSever

    final score = "0";//从游戏里获得这个参数，具体实现待定

    return Response.ok("score:$score");

    

    


  }
}
