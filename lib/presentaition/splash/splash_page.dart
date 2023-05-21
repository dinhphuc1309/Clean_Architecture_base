import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/domain/usecases/check_user_login_status.dart';
import 'package:clean_archtecture_base/route/app_routers.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () {
    //     serviceLocator<CheckUserLoginStatus>()
    //         .checkIfUserLoggedIn()
    //         .then((isUserLoggedIn) {
    //       context.go(isUserLoggedIn ? RoutePath.home : RoutePath.login);
    //     });
    //   },
    // );

    serviceLocator<CheckUserLoginStatusUseCase>()
        .checkIfUserLoggedIn()
        .then((isUserLoggedIn) {
      context.go(isUserLoggedIn ? RoutePath.home : RoutePath.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Splash Screen',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 200.0,
                child: LinearProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
