import 'package:flutter/material.dart';
import 'package:maksimal_test/features/home/data/models/users.dart';
import 'package:maksimal_test/features/home/presentation/pages/home_page.dart';
import 'package:maksimal_test/features/user_detail/presentation/pages/user_detail_page.dart';



class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return _materialRoute(const HomePage(),
        );

      case '/userDetail':
        return _materialRoute(UserDetailPage(user: settings.arguments as Items,));

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
