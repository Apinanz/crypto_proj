import 'package:crypto_proj/pages/crypto/crypto_asks.dart';
import 'package:crypto_proj/pages/crypto/crypto_bids.dart';
import 'package:crypto_proj/pages/crypto/crypto_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MergePage extends StatefulWidget {
  static const routeName = '/merge';

  const MergePage({Key? key}) : super(key: key);

  @override
  _MergePageState createState() => _MergePageState();
}

var _subPageIndex = 0;

class _MergePageState extends State<MergePage> {
  @override
  Widget build(BuildContext context) {
    final sym = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(
            child: Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    'assets/images/${sym.substring(sym.indexOf('_') + 1, sym.length)}.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${sym.substring(sym.indexOf('_') + 1, sym.length)}/THB',
                  style: GoogleFonts.prompt(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.monetization_on_sharp),
              label: 'Bids'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.money_off_sharp),
              label: 'Asks'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.cached_outlined),
              label: 'Latest'),
        ],
        currentIndex: _subPageIndex,
        onTap: (index) {
          setState(() {
            _subPageIndex = index;
          });
        },
        unselectedItemColor: Colors.white,
        selectedItemColor: _subPageIndex == 0
            ? Colors.green.shade700
            : _subPageIndex == 1
                ? Colors.red.shade700
                : Colors.blueAccent,
      ),
      body: _buildSubPage(sym),
    );
  }

  Widget? _buildSubPage(String sym) {
    switch (_subPageIndex) {
      case 0:
        return Container(child: Center(child: BidsPage(sym: sym)));
      case 1:
        return Container(child: AsksPage(sym: sym));
      case 2:
        return Container(child: Center(child: HistoryPage(sym: sym)));
      default:
        return SizedBox.shrink();
    }
  }
}
