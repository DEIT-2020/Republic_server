import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_dart/app_component.template.dart' as ng;

void main() {
  runApp(ng.AppComponentNgFactory);
  var getChinesequstion = document.querySelector("#getChinesequstion")
    ..onClick.listen(getChineseQuestion);
}

//取题目
void getChineseQuestion(Event e) {
  window.alert('Confirmed!');
  // var path1= 'https://www.dartlang,org/f/portmanteaux.json';
  var path = 'http://localhost:8888/queryAllArticle';
//var path = 'myData.json';
  HttpRequest.getString(path).then((String fileContents) {
    final jsonResult = json.decode(fileContents);
    print(fileContents);
    print(jsonResult[0]);
    window.localStorage['qb'] = jsonResult;
  }).catchError((error) {
    print(error.toString());
  });
}
