import 'package:crypto_proj/pages/home/market_page.dart';
import 'package:crypto_proj/pages/home/sub_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

var _subPageIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.bar_chart_outlined),
                label: 'Market'),
          ],
          currentIndex: _subPageIndex,
          onTap: (index) {
            setState(() {
              _subPageIndex = index;
            });
          },
          unselectedItemColor: Colors.white,
          selectedItemColor: _subPageIndex == 0
              ? Colors.deepPurpleAccent.shade200
              : Colors.blueAccent),
      body: _buildSubPage(),
    );
  }

  Widget? _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return SubHomePage();
      case 1:
        return MarketPage();
      default:
        return SizedBox.shrink();
    }
  }
}
