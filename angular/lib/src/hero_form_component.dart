import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'user.dart';


@Component(
  selector: 'hero-form',
  templateUrl: 'hero_form_component.html',
  directives: [coreDirectives, formDirectives],
)
class HeroFormComponent {
  User model = User(123,'222','3333');
  bool submitted = false;


  void onSubmit() => submitted = true;
  
  
  void clear() {
  model.name = '';
  model.password = '';
  model.id = 0;
}
}

