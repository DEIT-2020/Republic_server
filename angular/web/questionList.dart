import 'dart:svg';

import 'package:angular/angular.dart';
import 'package:angular_components/utils/numbers/denomination.dart';
import 'package:angular_dart/app_component.template.dart' as ng;
import 'dart:html';
import 'dart:convert';

import 'addQuestion.dart';

var i = 0;
void main() {
  runApp(ng.AppComponentNgFactory);

  var qlist = document.querySelector('#qlist');
  var path = 'http://localhost:8888/questionCheck';
  HttpRequest.getString(path).then((String fileContents) {
    final jsonResult = json.decode(fileContents);
    print(fileContents[0]);
    print(jsonResult[0]);
    for (var i = 0; i < jsonResult.length; i++) {
      var li = document.createElement('li');
      //var span = document.createElement('span');
      qlist.append(li);

      li.innerHtml = '<span class="badge">' +
          jsonResult[i]['questionId'].toString() +
          '</span>' +
          jsonResult[i]['questionContent'] +
          ' ' +
          jsonResult[i]['answer'];
      //li.append(span);
      //span.innerHtml = jsonResult[i]['questionId'].toString();
      //  window.alert(li.innerHtml);

    }

    // setlistener();

    print(window.localStorage);
    //window.location.href = "/web-desktop/";
  }).catchError((error) {
    print(error.toString());
  });

  // var qlist = document.querySelector('#qlist');;


//  qlist.onClick.listen(add);
}
