
import 'package:crypto_proj/models/api_result.dart';
import 'package:crypto_proj/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatefulWidget {
  static const routeName = '/history';
  final String sym;
  const HistoryPage({Key? key, required this.sym}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final sym = ModalRoute.of(context)!.settings.arguments as String;
    //sym = coin;
    return Container(
      child: FutureBuilder<List<ApiResult>>(
        future: _loadTrade(sym),
        builder: (context, trade) {
          if (trade.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (trade.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('ผิดพลาด: ${trade.error}'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _loadTrade(sym);
                      });
                    },
                    child: Text('RETRY'),
                  ),
                ],
              ),
            );
          }

          if (trade.hasData) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  scrollDirection: Axis.vertical,
                  //shrinkWrap: true,
                  itemCount: trade.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var tradeList = trade.data![index];
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.all(8.0),
                      elevation: 5.0,
                      shadowColor: Colors.black.withOpacity(0.1),
                      color: Colors.grey.withOpacity(0.6),
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(
                                  label: Text(
                                    'Time',
                                    style: GoogleFonts.prompt(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn(
                                  label: Text(
                                    'Side',
                                    style: GoogleFonts.prompt(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn(
                                  label: Text(
                                    'Price(THB)',
                                    style: GoogleFonts.prompt(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn(
                                  label: Text(
                                    'Amount',
                                    style: GoogleFonts.prompt(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                            rows: [
                              for (dynamic trade in tradeList.result)
                                DataRow(cells: [

                                  DataCell(Text(
                                    '${_convertTime(trade[0])}',
                                    style: GoogleFonts.prompt(
                                      fontSize: 15.0,
                                      color: trade[3].toString()=="BUY"? Colors.green : Colors.red.shade600,
                                    ),
                                  )),
                                  DataCell(Text('${trade[3]}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color: trade[3].toString()=="BUY"? Colors.green : Colors.red.shade600,
                                      ))),
                                  DataCell(Text('${trade[1]}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color: trade[3].toString()=="BUY"? Colors.green : Colors.red.shade600,
                                      ))),
                                  DataCell(Text('${trade[2]}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      )))
                                ]),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
  Future<List<ApiResult>> _loadTrade(String sym) async {
    var trade = await Api()
        .fetchBids('api/market/trades', queryParams: {'sym': sym, 'lmt': '30'});
    return trade;
  }
  _convertTime(int time) {
    var data = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return '${data.minute} min ${data.second.toString()} sec';
  }
}
