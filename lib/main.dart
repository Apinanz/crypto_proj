import 'package:crypto_proj/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
