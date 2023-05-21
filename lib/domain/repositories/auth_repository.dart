import 'package:clean_archtecture_base/core/failure.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({required User user});
}
