import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitialState;
  const factory LoginState.loading() = LoginLoadingState;
  const factory LoginState.error(String message) = LoginErrorState;
  const factory LoginState.loaded({
    required User user,
  }) = LoginLoadedState;
}
