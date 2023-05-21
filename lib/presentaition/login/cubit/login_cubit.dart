import 'package:bloc/bloc.dart';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:clean_archtecture_base/domain/usecases/login.dart';
import 'package:clean_archtecture_base/presentaition/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  void loginUser({required User user}) async {
    emit(const LoginState.loading());
    var result = await serviceLocator<LoginUseCase>().loginUser(user);
    result.fold(
      (failure) {
        emit(LoginState.error(failure.message));
      },
      (data) {
        emit(LoginState.loaded(user: data));
      },
    );
  }
}
