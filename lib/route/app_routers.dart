import 'package:clean_archtecture_base/presentaition/home/pages/home_page.dart';
import 'package:clean_archtecture_base/presentaition/login/pages/login_page.dart';
import 'package:clean_archtecture_base/presentaition/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class RoutePath {
  RoutePath._();

  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
}

class AppRouter {
  late final GoRouter router = GoRouter(routes: [
    GoRoute(
        name: "Splash",
        path: RoutePath.splash,
        builder: (context, state) {
          return const SplashPage();
        }),
    GoRoute(
        name: "Login",
        path: RoutePath.login,
        builder: (context, state) {
          return const LoginPage();
        }),
    GoRoute(
        name: "Home",
        path: RoutePath.home,
        builder: (context, state) {
          return const HomepageScreen();
        }),
  ]);
}
