import 'package:flutter/material.dart';
import 'package:maksimal_test/features/authorization/presentation/pages/auth/auth_page.dart';
import 'package:maksimal_test/features/home/presentation/pages/home_page.dart';



class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        print('go to home');
        return _materialRoute(const HomePage(),
        );

      case '/auth':
        return _materialRoute(const AuthPage());

      default:
        return _materialRoute(const Scaffold(
          body: Text('from AppRoutes'),
        ));
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
