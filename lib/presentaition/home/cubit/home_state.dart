import 'package:clean_archtecture_base/data/model/product/product_model.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitialState;
  const factory HomeState.loading() = HomeLoadingState;
  const factory HomeState.error(String message) = HomeErrorState;
  const factory HomeState.loadedState({
    required ProductList productList,
    required User user,
  }) = HomeLoadedState;
}
