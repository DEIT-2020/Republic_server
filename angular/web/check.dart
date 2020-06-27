import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_dart/app_component.template.dart' as ng;
import 'package:http/http.dart' as http;

void main() {
  runApp(ng.AppComponentNgFactory);
  var getChinesequstion=document.querySelector("#questionSubmit")
  ..onClick.listen(checkQuestion);  

}




void checkQuestion(Event e) async{
  //window.console.log("yes");
 // var path1= 'https://www.dartlang,org/f/portmanteaux.json';

  
var question =document.querySelector('#QuestionId');
//window.alert((ID as InputElement).value);
var subject=document.querySelector('#QuestionSubject');
var ifC=document.querySelector('#ifChecked');

var data = {
      'questionId': (question as InputElement).value,
      'checkby': (ifC as InputElement).value,
    };


final response = await http.post('http://127.0.0.1:8888//questionCheck/[:id]',
        body: json.encode(data),
        headers: {"content-type": "application/json"}).then((response) {
      
      if (response.statusCode == 200) {
      window.alert("搜索成功");
      }else window.alert("搜索失败！");
   
    });
 
}
