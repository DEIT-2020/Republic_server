import 'package:angular/angular.dart';

import 'src/todo_list/todo_list_component.dart';

import 'package:angular_forms/angular_forms.dart';


// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [TodoListComponent],
)

@Component(
  selector: 'hero-form',
  templateUrl: 'src/hero_form_component.html',
  directives: [coreDirectives, formDirectives],
)

class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
