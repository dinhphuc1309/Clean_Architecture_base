import 'package:clean_archtecture_base/core/failure.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/datasource/product_datasource.dart';
import 'package:clean_archtecture_base/data/model/product/product_model.dart';
import 'package:clean_archtecture_base/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either<Failure, ProductList>> getProductsFromServer() {
    return serviceLocator<ProductDataSource>().getProductFromServer();
  }
}
