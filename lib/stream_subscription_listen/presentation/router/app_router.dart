import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    switch(routeSettings.name){
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
              title: "Home Screen",
              color: Colors.blueAccent,
            )
        );
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
              title: "Second Screen",
              color: Colors.blueAccent,
            )
        );
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
              title: "Third Screen",
              color: Colors.blueAccent,
            )
        );
      default:
        null;
    }
    return null;
  }

}

