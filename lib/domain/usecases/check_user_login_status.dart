import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/services/flutter_storage_secure_service.dart';

abstract class CheckUserLoginStatusUseCase {
  Future<bool> checkIfUserLoggedIn();
}

class CheckUserLoginStatusUseCaseImpl extends CheckUserLoginStatusUseCase {
  @override
  Future<bool> checkIfUserLoggedIn() async {
    final user = await serviceLocator<FlutterStorageSecureService>().getUser();
    return user != null;
  }
}
