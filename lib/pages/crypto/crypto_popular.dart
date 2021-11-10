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
  int _currentSortColumn = 2;
  bool _isAscending = true;
  late Future<List<CryptoTicker>> _futurePopular;

  @override
  Widget build(BuildContext context) {
    //sym = coin;
    return Container(
      child: FutureBuilder<List<CryptoTicker>>(
        future: _futurePopular,
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
                  color: Colors.white.withOpacity(1),
                  child: ListView(
                      padding: EdgeInsets.all(8.0),
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          child: SingleChildScrollView(
                            child: DataTable(
                              sortColumnIndex: _currentSortColumn,
                              sortAscending: _isAscending,
                              columns: [
                                DataColumn(
                                    label: Text(
                                  'Coin',
                                  style: GoogleFonts.prompt(
                                      fontSize: 18.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                )),
                                DataColumn(
                                    label: Text(
                                  'Volume(Coin)',
                                  style: GoogleFonts.prompt(
                                      fontSize: 18.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                )),
                                DataColumn(
                                    label: Text(
                                      'Volume(THB)',
                                      style: GoogleFonts.prompt(
                                          fontSize: 18.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onSort: (columnIndex, _) {
                                      setState(() {
                                        _currentSortColumn = columnIndex;
                                        if (_isAscending) {
                                          asks.data!.sort((productA,
                                                  productB) =>
                                              productB.quoteVolume.compareTo(
                                                  productA.quoteVolume));
                                          _isAscending = false;

                                        }
                                      });
                                    }),
                                DataColumn(
                                    label: Text(
                                  'Last Price(THB)',
                                  style: GoogleFonts.prompt(
                                      fontSize: 18.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ))
                              ],
                              rows: asks.data!.map((item) {
                                return DataRow(cells: [
                                  DataCell(Text(
                                    '${item.key.substring(item.key.indexOf('_') + 1, item.key.length)}',
                                    style: GoogleFonts.prompt(
                                      fontSize: 15.0,
                                      color: item.percentChange.toString().startsWith('-') as bool? Colors.red.shade700:Colors.green,
                                    ),
                                  )),
                                  DataCell(Text('${item.baseVolume}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color:  Colors.black54,
                                      ))),
                                  DataCell(Text('${item.quoteVolume}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color:  Colors.black54,
                                      ))),
                                  DataCell(Text('${item.last}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color:  item.percentChange.toString().startsWith('-') as bool? Colors.red.shade700:Colors.green,
                                      )))
                                ]);
                              }).toList(),
                            ),
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
  @override
  initState() {
    super.initState();
    _futurePopular = _loadCrypto();
  }


  Future<List<CryptoTicker>> _loadCrypto() async {
    return await Api().fetchTicker('api/market/ticker');
  }
}
