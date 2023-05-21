import 'package:clean_archtecture_base/core/failure.dart';
import 'package:clean_archtecture_base/core/request.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:clean_archtecture_base/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetLocalUserUsecase {
  Future<Either<Failure, User>> getUserFromLocalStorage();
}

class GetLocalUserUsecaseImpl extends GetLocalUserUsecase {
  @override
  Future<Either<Failure, User>> getUserFromLocalStorage() async {
    final response =
        await serviceLocator<UserRepository>().getUserFromLocalStorage();
    if (response.isRight()) {
      final responseUser = response.getOrElse(() => User());
      //persist user authorization in request
      serviceLocator<Request>().updateAuthorization(responseUser.token);
    }

    return response;
  }
}
