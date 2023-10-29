import 'package:flutter/material.dart';
import 'package:order/pages/add_user/add_user_screen.dart';
import 'package:order/pages/home/home_screen.dart';
import 'package:order/pages/ordering/ordering_screen.dart';
import 'package:order/routes/router_name.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RouterName.addUserRoute:
        return MaterialPageRoute(
          builder: (_) => const AddUserScreen(),
        );
      case RouterName.orderingRoute:
        return MaterialPageRoute(
          builder: (_) => const OrderingScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
