import 'package:crypto_proj/pages/crypto/crypto_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Market'),
      ),
      body: Container(
        color: Colors.black,
        child: CryptoListPage(),
      ),
    );
  }
}
