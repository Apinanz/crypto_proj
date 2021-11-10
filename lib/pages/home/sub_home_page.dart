import 'package:crypto_proj/pages/crypto/crypto_fav.dart';
import 'package:crypto_proj/pages/crypto/crypto_popular.dart';
import 'package:crypto_proj/pages/crypto/crypto_top_gain.dart';
import 'package:crypto_proj/pages/crypto/crypto_top_loser.dart';
import 'package:flutter/material.dart';

class SubHomePage extends StatefulWidget {
  const SubHomePage({Key? key}) : super(key: key);

  @override
  _SubHomePageState createState() => _SubHomePageState();
}

class _SubHomePageState extends State<SubHomePage> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Popular quote'),
    Tab(text: 'Top Gainer'),
    Tab(text: 'Top Loser'),
    Tab(text: 'Favorite'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          bottom: TabBar(
            tabs: myTabs,
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/logo_apix.png',
                  width: 100, height: 30, fit: BoxFit.cover),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Card(child: CryptoPopular()),
            Card(
              child: TopGainPage(),
            ),
            Card(
              child: TopLoserPage(),
            ),
            Card(
              child: CryptoFavPage(),
            )
          ],
        ),
      ),
    );
  }
}
