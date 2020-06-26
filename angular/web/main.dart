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
 // window.location.href = "/web-desktop/"; 
  // var path1= 'https://www.dartlang,org/f/portmanteaux.json';
  var path = 'http://localhost:8888/getChineseQuestion';
//var path = 'myData.json';
  HttpRequest.getString(path).then((String fileContents) {
    final jsonResult = json.decode(fileContents);
    print(fileContents[0]);
    print(jsonResult[0]);
    for(var i=0;i<10;i++)
    {window.localStorage['$i']=jsonResult[i]['question'];
    var a =i+10;
    window.localStorage['$a']=jsonResult[i]['answer'];}

    print(window.localStorage);
    window.location.href = "/web-desktop/";
  }).catchError((error) {
    print(error.toString());
  });


}
