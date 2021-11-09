
import 'package:crypto_proj/pages/crypto/crypto_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketPage extends StatefulWidget {
  static const routeName = '/market';
  const MarketPage({Key? key}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(
            child: Text(
              'Market',
              style: GoogleFonts.prompt(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: Container(
        color: Colors.black26,
        child: CryptoListPage(),
      ),
    );
  }
}
