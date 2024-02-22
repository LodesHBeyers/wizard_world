import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class WizardsRepository {
  final APIClient _apiClient;
  const WizardsRepository(
    this._apiClient,
  );

  Future<List<Wizard>> getAllWizards({
    String? firstName,
    String? lastName,
  }) =>
      _apiClient.fetchWizards(
        firstName: firstName,
        lastName: lastName,
      );

  Future<Wizard> getWizard(
    String id,
  ) =>
      _apiClient.fetchWizard(
        id: id,
      );
}

final Provider<WizardsRepository> wizardsRepositoryProvider =
    Provider<WizardsRepository>(
  (ProviderRef<WizardsRepository> ref) => WizardsRepository(
    ref.read(apiClientProvider),
  ),
);
