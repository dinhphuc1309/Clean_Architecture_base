import 'package:clean_archtecture_base/core/failure.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/datasource/auth_datasource.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:clean_archtecture_base/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, User>> login({required User user}) {
    return serviceLocator<AuthDataSource>().loginUser(
      user: user,
    );
  }
}
