import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/repositories/cached_repository.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class WizardsRepository extends CachedRepository<Wizard> {
  final APIClient _apiClient;

  WizardsRepository(
    this._apiClient,
  );

  Future<List<Wizard>> getAllWizards() async {
    if (cache.isNotEmpty) {
      return cache;
    }
    final List<Wizard> allWizards = await _apiClient.fetchWizards();
    updateCache(allWizards);
    return allWizards;
  }

  Future<List<Wizard>> getQueriedWizards({
    String? firstName,
    String? lastName,
  }) {
    return _apiClient.fetchWizards();
  }

  Future<Wizard> getWizard(
    String id,
  ) async {
    final Wizard wizard;
    if (cache.isNotEmpty) {
      wizard =
          cache.firstWhere((Wizard element) => element.id == id, orElse: () {
        throw DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 404,
          ),
        );
      });
    } else {
      wizard = await _apiClient.fetchWizard(
        id: id,
      );
    }
    return wizard;
  }
}

final Provider<WizardsRepository> wizardsRepositoryProvider =
    Provider<WizardsRepository>(
  (ProviderRef<WizardsRepository> ref) => WizardsRepository(
    ref.read(apiClientProvider),
  ),
);
