import 'package:crypto_proj/models/crypto_ticker.dart';
import 'package:crypto_proj/pages/crypto/crypto_fav.dart';
import 'package:crypto_proj/pages/crypto/crypto_merge.dart';
import 'package:crypto_proj/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({Key? key}) : super(key: key);

  @override
  _CryptoListPageState createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  late Future<List<CryptoTicker>> _futureCryptoList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<CryptoTicker>>(
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
                for (var item in CryptoFavPage.favList) {
                  cryptoItem.isFav = cryptoItem.key == item.key;
                }
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  shadowColor: Colors.black.withOpacity(0.2),
                  color: Colors.white.withOpacity(0.7),
                  child: InkWell(
                    onTap: () => _handleClickCoin(cryptoItem.key),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.star,
                                          color: !cryptoItem.isFav
                                              ? Colors.grey:Colors.yellow.shade700,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (!cryptoItem.isFav) {
                                              cryptoItem.isFav = !cryptoItem.isFav;
                                              CryptoFavPage.favList
                                                  .add(cryptoItem);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          'assets/images/${cryptoItem.key.substring(cryptoItem.key.indexOf("_") + 1, cryptoItem.key.length)}.png',
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          cryptoItem.key.substring(
                                              cryptoItem.key.indexOf("_") + 1,
                                              cryptoItem.key.length),
                                          style: GoogleFonts.prompt(
                                              fontSize: 18.0),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'change : ${cryptoItem.percentChange} %',
                                              style: GoogleFonts.prompt(
                                                  fontSize: 15.0,
                                                  color: cryptoItem
                                                              .percentChange
                                                              .toString()
                                                              .startsWith('-')
                                                          as bool
                                                      ? Colors.red.shade700
                                                      : Colors.green.shade700),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text('${cryptoItem.last}',
                                    style: GoogleFonts.prompt(fontSize: 20.0)),
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

  Future<List<CryptoTicker>> _loadCrypto() async {
    return await Api().fetchTicker('api/market/ticker');
  }

  @override
  initState() {
    super.initState();
    _futureCryptoList = _loadCrypto();
  }

  _handleClickCoin(String coin) {
    Navigator.pushNamed(
      context,
      MergePage.routeName,
      arguments: coin,
    );
  }
}
