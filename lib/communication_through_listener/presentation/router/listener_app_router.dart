import 'package:flutter/material.dart';

import '../screens/listener_home_screen.dart';
import '../screens/listener_second_screen.dart';
import '../screens/listener_third_screen.dart';

class ListenerAppRouter {
  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    switch(routeSettings.name){
      case '/':
        return MaterialPageRoute(
            builder: (_) => const ListenerHomeScreen(
              title: "Listen Home Screen",
              color: Colors.blueAccent,
            )
        );
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const ListenerSecondScreen(
              title: "Second Screen",
              color: Colors.blueAccent,
            )
        );
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ListenerThirdScreen(
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

