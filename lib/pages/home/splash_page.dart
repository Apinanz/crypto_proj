import 'package:crypto_proj/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: HomePage.routeName,
        image: Image.asset('assets/images/logo_apix.png'),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: TextStyle(color: Colors.deepPurple),
        photoSize: 150.0,
        loaderColor: Colors.blueAccent);
  }
}
