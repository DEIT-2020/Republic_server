import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_dart/app_component.template.dart' as ng;
import 'package:http/http.dart' as http;

void main() {
  runApp(ng.AppComponentNgFactory);
  var getChinesequstion = document.querySelector("#userRegisterSubmit")
    ..onClick.listen(register);
}

void register(Event e) async {
  //window.console.log("yes");
  // var path1= 'https://www.dartlang,org/f/portmanteaux.json';

  var ID = document.querySelector('#registerID');
  var name = document.querySelector('#NameRigister');
//window.alert((ID as InputElement).value);
  var password1 = document.querySelector('#Password1');
  var password2 = document.querySelector('#Password2');

  if ((password1 as InputElement).value != (password2 as InputElement).value) {
    var a = (password1 as InputElement).value;
    window.alert('$a' + "两次输入不一致！");
    return;
  } else {
  
    var data = {
      'id': int.parse((ID as InputElement).value),
      'password': (password2 as InputElement).value,
      'username': (name as InputElement).value,
    };

/* await HttpRequest.request('http://127.0.0.1:8888/register',method: 'POST', mimeType:'application/json', sendData: json.encode(data)).then((HttpRequest resp) {
          print('response: ${resp.responseText}');
       });*/
 //window.alert("注册成功");
    final response = await http.post('http://127.0.0.1:8888/register',
        body: json.encode(data),
        headers: {"content-type": "application/json"}).then((response) {
      
      if (response.statusCode == 200) {
      window.alert("注册成功");
      } else if(response.statusCode==409){
        window.alert("name或id冲突！");
      }else window.alert("注册失败！");
   
    });
    ;
  }
}

//var response = await http.post('http://127.0.0.1:8888/register',headers: {"Content-Type":"application/json"}, body: {'name': 'doodle', 'color': 'blue'});
