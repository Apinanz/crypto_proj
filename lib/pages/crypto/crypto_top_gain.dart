
import 'package:crypto_proj/models/crypto_ticker.dart';
import 'package:crypto_proj/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopGainPage extends StatefulWidget {
  const TopGainPage({Key? key}) : super(key: key);

  @override
  _TopGainPageState createState() => _TopGainPageState();
}

class _TopGainPageState extends State<TopGainPage> {
  int _currentSortColumn = 3;
  bool _isAscending = true;
  late Future<List<CryptoTicker>> _futureTopGain;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<CryptoTicker>>(
        future:  _futureTopGain,
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

                      children: [
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
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
                                      'Last Price(THB)',
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
                                      '24h Change(%)',
                                      style: GoogleFonts.prompt(
                                          fontSize: 18.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),onSort: (columnIndex, _) {
                                  setState(() {
                                    _currentSortColumn = columnIndex;
                                    if (_isAscending) {
                                      asks.data!.sort((productA,
                                          productB) =>
                                          productB.percentChange.compareTo(
                                              productA.percentChange));
                                      _isAscending = false;

                                    }
                                  });
                                })
                              ],
                              rows: asks.data!.map((item) {
                                return  DataRow(cells: [
                                  DataCell(Text(
                                    '${item.key.substring(item.key.indexOf('_') + 1, item.key.length)}',
                                    style: GoogleFonts.prompt(
                                      fontSize: 15.0,
                                      color: Colors.green,
                                    ),
                                  )),
                                  DataCell(Text('${item.last}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color:  Colors.black54,
                                      ))),
                                  DataCell(Text('${item.baseVolume}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color:  Colors.black54,
                                      ))),
                                  DataCell(Text('${item.percentChange}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color:Colors.green,
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
    _futureTopGain = _loadCrypto();
  }


  Future<List<CryptoTicker>> _loadCrypto() async {
    return await Api().fetchTicker('api/market/ticker');
  }
}
