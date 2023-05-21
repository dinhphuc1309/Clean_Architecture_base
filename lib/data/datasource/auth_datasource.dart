import 'package:clean_archtecture_base/core/failure.dart';
import 'package:clean_archtecture_base/core/request.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';

abstract class AuthDataSource {
  Future<Either<Failure, User>> loginUser({required User user});
}

class AuthDataSourceImpl implements AuthDataSource {
  final Request request = serviceLocator<Request>();

  @override
  Future<Either<Failure, User>> loginUser({required User user}) async {
    try {
      final response = await request.post(
        'auth/login',
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return Right(User.fromJson(response.data));
      }
      return Left(ConnectionFailure(response.data['code']));
    } catch (e) {
      debugPrint('AuthenDataSourceImplError $e');
      return const Left(
        Exception('Exception Occured in AuthenDataSourceImpl'),
      );
    }
  }
}
