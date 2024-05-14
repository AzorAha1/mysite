import 'package:flutter/material.dart';
import 'package:mysite/screens/home.dart';
enum Routes {
  home
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home.name,
      routes: {
        Routes.home.name:(context) => const Home()
      },
    );
  }
}

