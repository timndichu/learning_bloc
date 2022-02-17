// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning_bloc/presentation/screens/home_screen.dart';
import 'package:learning_bloc/presentation/screens/second_screen.dart';
import 'package:learning_bloc/presentation/screens/third_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => Homescreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: "Second Screen",
            color: Colors.redAccent,
            // homeScreenKey: key,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: "Third Screen",
            color: Colors.green,
          ),
        );
      default:
        return null;
    }
  }
}
