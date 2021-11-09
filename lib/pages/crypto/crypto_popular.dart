import 'package:crypto_proj/models/crypto_ticker.dart';
import 'package:crypto_proj/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoPopular extends StatefulWidget {
  const CryptoPopular({Key? key}) : super(key: key);

  @override
  _CryptoPopularState createState() => _CryptoPopularState();
}

class _CryptoPopularState extends State<CryptoPopular> {

  @override
  Widget build(BuildContext context) {
    //sym = coin;
    return Container(
      child: FutureBuilder<List<CryptoTicker>>(
        future: _loadCrypto(),
        builder: (context, asks) {
          if (asks.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (asks.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('ผิดพลาด: ${asks.error}'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _loadCrypto();
                      });
                    },
                    child: Text('RETRY'),
                  ),
                ],
              ),
            );
          }

          if (asks.hasData) {
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(color: Colors.black54),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  shadowColor: Colors.black.withOpacity(0.1),
                  color: Colors.white.withOpacity(0.8),
                  child: ListView(
                      padding: EdgeInsets.all(8.0),
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          child: DataTable(

                            columns: [
                              DataColumn(
                                  label: Text(
                                'Coin',
                                style: GoogleFonts.prompt(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataColumn(
                                  label: Text(
                                'Volume(Coin)',
                                style: GoogleFonts.prompt(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataColumn(
                                  label: Text(
                                'Volume(THB)',
                                style: GoogleFonts.prompt(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                              DataColumn(
                                  label: Text(
                                'Last Price(THB)',
                                style: GoogleFonts.prompt(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                            rows: [
                              for (var tickerList in asks.data!)
                                DataRow(cells: [
                                  DataCell(Text(
                                    '${tickerList.key.substring(tickerList.key.indexOf('_')+1,tickerList.key.length)}',
                                    style: GoogleFonts.prompt(
                                      fontSize: 15.0,
                                      color: Colors.red.shade600,
                                    ),
                                  )),
                                  DataCell(Text('${tickerList.baseVolume}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ))),
                                  DataCell(Text('${tickerList.quoteVolume}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ))),
                                  DataCell(Text('${tickerList.last}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      )))
                                ]),
                            ],
                          ),
                        )
                      ]
                      //}
                      ),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Future<List<CryptoTicker>> _loadCrypto() async {
    return await Api().fetchTicker('api/market/ticker');
  }
}
