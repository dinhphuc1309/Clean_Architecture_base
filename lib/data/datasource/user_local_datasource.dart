import 'package:clean_archtecture_base/core/failure.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:clean_archtecture_base/services/flutter_storage_secure_service.dart';
import 'package:dartz/dartz.dart';

abstract class UserLocalDataSource {
  Future<Either<Failure, User>> getUserFromLocalStorage();
}

class UserLocalDataSourceImlp extends UserLocalDataSource {
  @override
  Future<Either<Failure, User>> getUserFromLocalStorage() async {
    try {
      final user = serviceLocator<FlutterStorageSecureService>().user;
      if (user != null) {
        return Right(User.fromJson(user.toJson()));
      }
      return const Left(
        LocalDatabaseQueryFailure('Unable to query form the shared prefs'),
      );
    } catch (e) {
      return const Left(
        ParsingFailure(
          'Parsing failure occured in HomepageLocalDataSourceImlp',
        ),
      );
    }
  }
}
