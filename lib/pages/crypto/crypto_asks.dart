import 'package:crypto_proj/models/api_result.dart';
import 'package:crypto_proj/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AsksPage extends StatefulWidget {
  static const routeName = '/asks';
  final String sym;

  const AsksPage({Key? key, required this.sym}) : super(key: key);

  @override
  _AsksPageState createState() => _AsksPageState();
}

class _AsksPageState extends State<AsksPage> {
  @override
  Widget build(BuildContext context) {
    final sym = ModalRoute.of(context)!.settings.arguments as String;
    //sym = coin;
    return Container(
      child: FutureBuilder<List<ApiResult>>(
        future: _loadBids(sym),
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
                        _loadBids(sym);
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
              backgroundColor: Colors.black,
              body: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  scrollDirection: Axis.vertical,
                  //shrinkWrap: true,
                  itemCount: asks.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var bidsList = asks.data![index];
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.all(8.0),
                      elevation: 5.0,
                      shadowColor: Colors.black.withOpacity(0.1),
                      color: Colors.grey.withOpacity(0.6),
                      child: Container(
                        child: DataTable(
                          columns: [
                            DataColumn(
                                label: Text(
                              'Price ASKS',
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
                            for (dynamic bid in bidsList.result)
                              DataRow(cells: [
                                DataCell(Text(
                                  '${bid[3]}',
                                  style: GoogleFonts.prompt(
                                    fontSize: 15.0,
                                    color: Colors.red.shade600,
                                  ),
                                )),
                                DataCell(Text('${bid[4]}',
                                    style: GoogleFonts.prompt(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    )))
                              ]),
                          ],
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

  Future<List<ApiResult>> _loadBids(String sym) async {
    var asks = await Api()
        .fetchBids('api/market/asks', queryParams: {'sym': sym, 'lmt': '30'});
    return asks;
  }
}
