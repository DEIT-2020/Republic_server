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

class gameController extends ResourceController {


  @Operation.get()
  Future<Response> showGameInfo() async {

    final info =  "游戏简介";



    return Response.ok(info);

    

    


  }
}
