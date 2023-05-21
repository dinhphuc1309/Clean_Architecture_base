import 'package:clean_archtecture_base/core/failure.dart';
import 'package:clean_archtecture_base/core/request.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/model/product/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDataSource {
  Future<Either<Failure, ProductList>> getProductFromServer();
}

class ProductDataSourceImpl extends ProductDataSource {
  @override
  Future<Either<Failure, ProductList>> getProductFromServer() async {
    try {
      final Request request = serviceLocator<Request>();
      final response = await request.get('/products');
      if (response.statusCode == 200) {
        ProductList productList = [];
        final productListMap = response.data["products"];
        for (var product in productListMap) {
          productList.add(Product.fromJson(product));
        }
        return Right(productList);
      }
      return Left(
        ConnectionFailure(response.data['message']),
      );
    } catch (e) {
      return const Left(
        ParsingFailure('Unable to parse the response'),
      );
    }
  }
  //
}
