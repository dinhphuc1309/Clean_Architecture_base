import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:clean_archtecture_base/generated/l10n.dart';
import 'package:clean_archtecture_base/presentaition/login/cubit/login_cubit.dart';
import 'package:clean_archtecture_base/presentaition/login/cubit/login_state.dart';
import 'package:clean_archtecture_base/route/app_routers.dart';
import 'package:clean_archtecture_base/validators/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  EmailInput _email = EmailInput.pure();

  String? _validateEmail() {
    if (_email.error == EmailInputError.empty) {
      return S.of(context).emailEmpty;
    }
    if (_email.error == EmailInputError.invalid) {
      return S.of(context).emailInvalid;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).hello,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                    controller: _emailController,
                    onChanged: (email) {
                      _email = EmailInput.dirty(email);
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (_) => _validateEmail()),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Pass',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message,
                    ),
                  ),
                );
              } else if (state is LoginLoadedState) {
                context.go(RoutePath.home);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'User logged in successfully',
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SizedBox(
                height: 54.0,
                width: 180.0,
                child: ElevatedButton(
                  key: const Key('login-button'),
                  style: const ButtonStyle(),
                  onPressed: () {
                    context.read<LoginCubit>().loginUser(
                          user: User(
                            username: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                  },
                  child: const Text(
                    'Login',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
