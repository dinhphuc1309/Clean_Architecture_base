import 'package:bloc/bloc.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:clean_archtecture_base/domain/usecases/get_local_user.dart';
import 'package:clean_archtecture_base/domain/usecases/get_products.dart';
import 'package:clean_archtecture_base/presentaition/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  void fetchData() async {
    emit(const HomeState.loading());
    var userResult =
        await serviceLocator<GetLocalUserUsecase>().getUserFromLocalStorage();

    var result = await serviceLocator<GetProductsFromServerUsecase>()
        .getProductsFromServer();
    result.fold(
      (failure) {
        emit(HomeState.error(failure.message));
      },
      (data) {
        emit(
          HomeState.loadedState(
            productList: data,
            user: userResult.getOrElse(
              () => User(),
            ),
          ),
        );
      },
    );
  }
}
