import 'package:dio/dio.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/data/entities/spell.dart';
import 'package:wizard_world/data/entities/wizard.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://wizard-world-api.herokuapp.com')
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  @GET('/Elixirs')
  Future<List<Elixir>> fetchElixirs({
    @Query('Name') String? name,
    @Query('Difficulty') String? difficulty,
    @Query('Ingredient') String? ingredient,
    @Query('InventorFullName') String? inventorFullName,
    @Query('Manufacturer') String? manufacturer,
  });

  @GET('/Elixirs/{id}')
  Future<Elixir> fetchElixir({
    @Path('id') required String id,
  });

  @GET('/Houses')
  Future<List<House>> fetchHouses();

  @GET('/Houses/{id}')
  Future<House> fetchHouse({
    @Path('id') required String id,
  });

  @GET('/Ingredients')
  Future<List<Ingredient>> fetchIngredients({
    @Query('Name') String? name,
  });

  @GET('/Ingredients/{id}')
  Future<Ingredient> fetchIngredient({
    @Path('id') required String id,
  });

  @GET('/Spells')
  Future<List<Spell>> fetchSpells({
    @Query('Name') String? name,
    @Query('Type') String? type,
    @Query('Incantation') String? incantation,
  });

  @GET('/Spells/{id}')
  Future<Spell> fetchSpell({
    @Path('id') required String id,
  });

  @GET('/Wizards')
  Future<List<Wizard>> fetchWizards({
    @Query('FirstName') String? firstName,
    @Query('LastName') String? lastName,
  });

  @GET('/Wizards/{id}')
  Future<Wizard> fetchWizard({
    @Path('id') required String id,
  });
}
