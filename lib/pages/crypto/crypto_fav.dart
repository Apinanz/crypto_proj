import 'package:crypto_proj/models/crypto_ticker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoFavPage extends StatefulWidget {
  const CryptoFavPage({Key? key}) : super(key: key);
  static List<CryptoTicker> favList = [];

  @override
  _CryptoFavPageState createState() => _CryptoFavPageState();
}

class _CryptoFavPageState extends State<CryptoFavPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      scrollDirection: Axis.vertical,
      //shrinkWrap: true,
      itemCount: CryptoFavPage.favList.length,
      itemBuilder: (BuildContext context, int index) {
        var cryptoItem = CryptoFavPage.favList[index];

        return Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsets.all(8.0),
          elevation: 5.0,
          shadowColor: Colors.black.withOpacity(0.2),
          color: Colors.white.withOpacity(0.7),
          child: Row(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                                    ? Colors.yellow.shade700 : Colors.yellow.shade700 ,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (cryptoItem.isFav) {
                                    CryptoFavPage.favList.remove(cryptoItem);
                                    cryptoItem.isFav = !cryptoItem.isFav;
                                  }else{
                                    CryptoFavPage.favList.remove(cryptoItem);
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                cryptoItem.key.substring(
                                    cryptoItem.key.indexOf("_") + 1,
                                    cryptoItem.key.length),
                                style: GoogleFonts.prompt(fontSize: 18.0),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'change : ${cryptoItem.percentChange} %',
                                    style: GoogleFonts.prompt(
                                        fontSize: 15.0,
                                        color: cryptoItem.percentChange
                                                .toString()
                                                .startsWith('-') as bool
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
        );
      },
    );
  }
}
