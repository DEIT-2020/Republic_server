import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'hero.dart';
import 'mock_heroes.dart';

@Component(
  selector: 'hero_list',
  templateUrl: 'hero_list_component.html',
  styleUrls: const ['hero_list_component.css'],
  directives: const [CORE_DIRECTIVES, formDirectives],
)
class AppComponent {
  final title = 'Tour of Heroes';
  List<Hero> heroes = mockHeroes;
  Hero selectedHero;

  void onSelect(Hero hero) => selectedHero = hero;
}