import 'package:clean_archtecture_base/core/failure.dart';
import 'package:clean_archtecture_base/core/request.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:clean_archtecture_base/domain/repositories/auth_repository.dart';
import 'package:clean_archtecture_base/services/flutter_storage_secure_service.dart';
import 'package:dartz/dartz.dart';

abstract class LoginUseCase {
  Future<Either<Failure, User>> loginUser(User user);
}

class LoginUseCaseImpl extends LoginUseCase {
  @override
  Future<Either<Failure, User>> loginUser(User user) async {
    final response = await serviceLocator<AuthRepository>().login(user: user);
    if (response.isRight()) {
      final remoteUser = response.getOrElse(() => User());
      serviceLocator<Request>().updateAuthorization(
        remoteUser.token,
      );
      await serviceLocator<FlutterStorageSecureService>().saveUser(remoteUser);
    }
    return response;
  }
}
