import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wizard_world/presentation/modals/app_snack.dart';

mixin ExceptionHandler {
  void handleException(
    Object e,
    StackTrace s, {
    String? userMessage,
    bool showMessage = true,
  }) {
    if (kDebugMode) {
      print(
        "Exception: ${e.toString()} \n\n StackTrace: \n ${s.toString()}",
      );
    } else {
      // Insert Firebase crashlytics etc here
    }
    if (showMessage) {
      AppSnackBar.show(message: userMessage ?? _formatException(e));
    }
  }

  static String _formatException(Object e) {
    if (e is DioException) {
      switch (e.response?.statusCode ?? -1) {
        case 400:
          return "Its Leviosa, not Leviosar. Your owl sent the wrong thing!";
        // Wrong universe but can't resist
        case 403:
          return "YOU SHALL NOT PASS!!!";
        case 404:
          return "Blimey, accio could not find what you were looking for";
        case 408:
          return "Gargoyles and gorgons! Your accio took too long.";
        // Blanket any server errors
        case > 500:
          return "Crikey, the wrong potion was used... Please try again later";
      }
    }

    // Return default error message
    return "It's not leviosaaaaah! ";
  }
}
