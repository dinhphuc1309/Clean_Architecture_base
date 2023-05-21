import 'package:clean_archtecture_base/core/failure.dart';
import 'package:clean_archtecture_base/data/model/product/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductList>> getProductsFromServer();
}
