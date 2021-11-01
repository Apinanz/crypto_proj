import 'package:crypto_proj/models/crypto_item.dart';
import 'package:crypto_proj/models/crypto_ticker.dart';
import 'package:crypto_proj/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({Key? key}) : super(key: key);

  @override
  _CryptoListPageState createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  late Future<List<CryptoItem>> _futureCryptoList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<CryptoItem>>(
        future: _futureCryptoList,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('ผิดพลาด: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _futureCryptoList = _loadCrypto();
                      });
                    },
                    child: Text('RETRY'),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              scrollDirection: Axis.vertical,
              //shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var cryptoItem = snapshot.data![index];
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: InkWell(
                    //onTap: () => _handleClickFoodItem(foodItem),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      'assets/images/${cryptoItem.symbol.substring(cryptoItem.symbol.indexOf("_") + 1, cryptoItem.symbol.length)}.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      cryptoItem.symbol.substring(
                                          cryptoItem.symbol.indexOf("_") + 1,
                                          cryptoItem.symbol.length),
                                      style: GoogleFonts.prompt(fontSize: 18.0),
                                    ),
                                    Text(
                                      '${cryptoItem.info}',
                                      style: GoogleFonts.prompt(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }

  Future<List<CryptoItem>> _loadCrypto() async {
    List list = await Api().fetchSymbol('api/market/symbols');
    var cryptoList = list.map((item) => CryptoItem.fromJson(item)).toList();
    return cryptoList;
  }
  @override
  initState() {
    super.initState();
    _futureCryptoList = _loadCrypto();
  }
}
