import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/services/network/api_client.dart';

// TODO [LB] Flesh out dio and add logger interceptor

final Provider<APIClient> apiClientProvider = Provider<APIClient>(
  (ProviderRef<APIClient> ref) {
    return APIClient(
      Dio(
        BaseOptions(
          connectTimeout: const Duration(
            seconds: 10,
          ),
        ),
      ),
    );
  },
);
