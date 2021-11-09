import 'package:crypto_proj/models/api_result.dart';
import 'package:crypto_proj/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BidsPage extends StatefulWidget {
  static const routeName = '/bids';
  final String sym;

  const BidsPage({Key? key, required this.sym}) : super(key: key);

  @override
  _BidsPageState createState() => _BidsPageState();
}

class _BidsPageState extends State<BidsPage> {
  //String sym = "THB_AAVE";

  @override
  Widget build(BuildContext context) {
    final sym = ModalRoute.of(context)!.settings.arguments as String;
    //sym = coin;
    return Container(
      child: FutureBuilder<List<ApiResult>>(
        future: _loadBids(sym),
        builder: (context, bids) {
          if (bids.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (bids.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('ผิดพลาด: ${bids.error}'),
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

          if (bids.hasData) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  scrollDirection: Axis.vertical,
                  //shrinkWrap: true,
                  itemCount: bids.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var bidsList = bids.data![index];
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
                              'Price BIDS',
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
                                    color: Colors.green,
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
    var bids = await Api()
        .fetchBids('api/market/bids', queryParams: {'sym': sym, 'lmt': '30'});
    return bids;
  }
}
