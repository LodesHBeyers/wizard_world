import 'package:wizard_world/services/modals/app_snack.dart';

class ExceptionHandler {
  // Inject Firebase crashlytics etc here
  const ExceptionHandler._();

  ExceptionHandler get instance => const ExceptionHandler._();

  void log(Object e, StackTrace s) {}

  void _showSnack() {
    AppSnackBar.show(
      message: "Oops! Something went wrong. Please try again.",
    );
  }
}
