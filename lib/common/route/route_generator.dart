import 'package:chattie/features/login/screens/login_screen.dart';
import 'package:chattie/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      default:
        debugPrint('Navigating to ${settings.name}');
        return buildErrorRoute();
    }
  }

  static Route<dynamic> buildErrorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Arggg!'),
          ),
          body: const Center(
            child: Text('Oh No! You should not be here! '),
          ),
        );
      },
    );
  }
}
