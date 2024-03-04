import 'package:mockito/annotations.dart';
import 'package:wizard_world/data/repositories/elixirs_repository.dart';
import 'package:wizard_world/data/repositories/houses_repository.dart';
import 'package:wizard_world/data/repositories/ingredients_repository.dart';
import 'package:wizard_world/data/repositories/spells_repository.dart';
import 'package:wizard_world/data/repositories/wizards_repository.dart';

// A little hacky, but it  nests all mocks in a single file instead of generating multiple mock files for every test
@GenerateNiceMocks([
  MockSpec<ElixirsRepository>(),
  MockSpec<HousesRepository>(),
  MockSpec<IngredientsRepository>(),
  MockSpec<SpellsRepository>(),
  MockSpec<WizardsRepository>(),
])
void main() {}
