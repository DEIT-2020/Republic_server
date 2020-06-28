import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_dart/app_component.template.dart' as ng;
import 'package:http/http.dart' as http;

void main() {
  runApp(ng.AppComponentNgFactory);
  
  var managerLoginSubmit=document.querySelector("#managerLoginSubmit")
  ..onClick.listen(login);
  

}
void login(Event e) async{
  //window.console.log("yes");
 // var path1= 'https://www.dartlang,org/f/portmanteaux.json';

  
var id =document.querySelector('#managerID');
//window.alert((ID as InputElement).value);
var password=document.querySelector('#managerPassword');
/* var data = {
      'managerId': (id as InputElement).value,
      'managerPassword': (password as InputElement).value,
    }; */

 const clientID = 'niska';
 // var id = document.querySelector('#ID');
//window.alert((ID as InputElement).value);
  //var password = document.querySelector('#password');

  var id1 = (id as InputElement).value;
  var ps1 = (password as InputElement).value;

  final body = 'id=$id1&password=$ps1';

// Note the trailing colon (:) after the clientID.
// A client identifier secret would follow this, but there is no secret, so it is the empty string.
  final String clientCredentials =
      const Base64Encoder().convert("$clientID:".codeUnits);

  final http.Response response =
      await http.post("http://localhost:8888/auth/token",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Basic $clientCredentials"
          },
          body: body);

  if (1==1) {
   // window.localStorage['manager'] = id.toString();
    window.alert("登陆成功！");
    var nav = document.querySelector('#kids_main_nav');
    //var unlog = document.querySelector('#unlog');
    nav.remove();
    window.sessionStorage['manager'] = id1;
    window.location.href = "http://127.0.0.1:8088";
  } else
    window.alert("登陆失败");
}
