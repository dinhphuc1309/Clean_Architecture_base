import 'package:clean_archtecture_base/core/request.dart';
import 'package:clean_archtecture_base/data/datasource/auth_datasource.dart';
import 'package:clean_archtecture_base/data/datasource/product_datasource.dart';
import 'package:clean_archtecture_base/data/datasource/user_local_datasource.dart';
import 'package:clean_archtecture_base/data/repositories/auth_repository_impl.dart';
import 'package:clean_archtecture_base/data/repositories/product_repository_impl.dart';
import 'package:clean_archtecture_base/data/repositories/user_repository_impl.dart';
import 'package:clean_archtecture_base/domain/repositories/auth_repository.dart';
import 'package:clean_archtecture_base/domain/repositories/product_repository.dart';
import 'package:clean_archtecture_base/domain/repositories/user_repository.dart';
import 'package:clean_archtecture_base/domain/usecases/get_local_user.dart';
import 'package:clean_archtecture_base/domain/usecases/get_products.dart';
import 'package:clean_archtecture_base/domain/usecases/check_user_login_status.dart';
import 'package:clean_archtecture_base/domain/usecases/login.dart';
import 'package:clean_archtecture_base/services/flutter_storage_secure_service.dart';
import 'package:clean_archtecture_base/services/shared_preferences_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;
Future<void> setUpServiceLocator() async {
  //=========================================usecase=========================================
  //check if user logged in or not
  serviceLocator.registerFactory<CheckUserLoginStatusUseCase>(
    () => CheckUserLoginStatusUseCaseImpl(),
  );
  serviceLocator
      .registerFactory<GetLocalUserUsecase>(() => GetLocalUserUsecaseImpl());
  serviceLocator.registerFactory<GetProductsFromServerUsecase>(
      () => GetProductsFromServerUsecaseImpl());
  serviceLocator.registerFactory<LoginUseCase>(() => LoginUseCaseImpl());

  //=========================================repositories=========================================
  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
  serviceLocator
      .registerFactory<ProductRepository>(() => ProductRepositoryImpl());
  serviceLocator.registerFactory<UserRepository>(() => UserRepositoryImpl());

  //=========================================datasource=========================================
  serviceLocator.registerFactory<AuthDataSource>(() => AuthDataSourceImpl());
  serviceLocator
      .registerFactory<ProductDataSource>(() => ProductDataSourceImpl());
  serviceLocator
      .registerFactory<UserLocalDataSource>(() => UserLocalDataSourceImlp());

  //=========================================services=========================================
  serviceLocator
      .registerSingleton<SharedPreferencesService>(SharedPreferencesService());
  serviceLocator.registerSingleton<FlutterStorageSecureService>(
      FlutterStorageSecureService());

  //=========================================external=========================================
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);

  const flutterSecureStorage = FlutterSecureStorage();
  serviceLocator
      .registerFactory<FlutterSecureStorage>(() => flutterSecureStorage);

  //=========================================request=========================================
  serviceLocator.registerSingleton<Request>(Request());
}
