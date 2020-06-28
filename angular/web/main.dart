import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_dart/app_component.template.dart' as ng;

void main() {
  runApp(ng.AppComponentNgFactory);
  var getChinesequstion = document.querySelector("#getChinesequstion")
    ..onClick.listen(getChineseQuestion);
  // window.localStorage.clear();

  if (window.sessionStorage['user'] != null) {
    var nav = document.querySelector('#kids_main_nav');
    //var unlog = document.querySelector('#unlog');
    nav.remove();
  }
  if (window.sessionStorage['manager'] != null) {
    var nav = document.querySelector('#kids_main_nav');
    var unlog = document.querySelector('#unlog');
    nav.remove();

    var div = document.createElement('div');

    div.innerHtml =
        '<nav id="kids_main_nav"><ul class="clearfix" id="clearfix"><li class="current-menu-item"><a href="index.html">首页</a></li><li ><a href="questionList.html">查看所有待审核题目</a></li><li><a href="checkQuestion.html">搜索题目</a></li></ul></nav>';
    unlog.append(div);
    var clearfix = querySelector("#clearfix");
    clearfix.setAttribute("style", "margin-top : 90px");
  }
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
    for (var i = 0; i < 10; i++) {
      window.localStorage['$i'] = jsonResult[i]['question'];
      var a = i + 10;
      window.localStorage['$a'] = jsonResult[i]['answer'];
    }

    print(window.localStorage);
    window.location.href = "/web-desktop/";
  }).catchError((error) {
    print(error.toString());
  });
}
