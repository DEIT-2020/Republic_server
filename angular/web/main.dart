import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_dart/app_component.template.dart' as ng;

void main() {
  runApp(ng.AppComponentNgFactory);
   var userLoginSubmit=document.querySelector("#userLoginSubmit")
  ..onClick.listen(login); 
}

void login(Event e){
  //window.console.log("yes");
 // var path1= 'https://www.dartlang,org/f/portmanteaux.json';
  var path = 'http://localhost:90';
  var httpRequest = new HttpRequest();
  httpRequest
   ..open('Get', path)
   ..onLoadEnd.listen((e) => requestComplete(httpRequest))
   ..send('');

}

void requestComplete(HttpRequest request)
{

  window.console.log("yesyes");
  if(request.status==200){
    List<String> userAthu = 
    json.decode(request.responseText) as List<String>;

    if (userAthu =='ok')
    { var div=document.querySelector("#unlog");
      var id=document.querySelector("#ID");
      div.children.clear();//移除最上面的登陆栏
      div.appendText(id.innerHtml);

    }

  }
}