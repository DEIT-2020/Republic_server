import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_dart/app_component.template.dart' as ng;
import 'package:http/http.dart' as http;

void main() {
  runApp(ng.AppComponentNgFactory);
  var getChinesequstion=document.querySelector("#questionSubmit")
  ..onClick.listen(addQuestion);  

}




void addQuestion(Event e) async{
  //window.console.log("yes");
 // var path1= 'https://www.dartlang,org/f/portmanteaux.json';

  
var question =document.querySelector('#setQuestion');
//window.alert((ID as InputElement).value);
var answer=document.querySelector('#setAnswer');
var subject=document.querySelector('#questionSubject');


var url = 'http://localhost:8888/questionAdd';
var response = await http.post(url, body: {'questionContent': (question as InputElement).value,
'questionSubject':(subject as InputElement).value,
 'answer':(answer as InputElement).value});//上传参数
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

 
}
