
class CryptoTicker {
  final String key;
  final int id;
  final double last;
  final double lowestAsk;
  final double highestBid;
  final double percentChange;
  final double baseVolume;
  final double quoteVolume;
  final double isFrozen;
  final double high24hr;
  final double low24hr;
  bool isFav = false;
  CryptoTicker({
    required this.key,
    required this.id,
    required this.last,
    required this.lowestAsk,
    required this.highestBid,
    required this.percentChange,
    required this.baseVolume,
    required this.quoteVolume,
    required this.isFrozen,
    required this.high24hr,
    required this.low24hr});

  factory CryptoTicker.fromJson(String tickerKey,Map<String, dynamic> json){
    return CryptoTicker(
      key : tickerKey,
      id: json['id'],
      last: json['last'].toDouble(),
      lowestAsk: json['lowestAsk'].toDouble(),
      highestBid: json['highestBid'].toDouble(),
      percentChange: json['percentChange'].toDouble(),
      baseVolume: json['baseVolume'].toDouble(),
      quoteVolume: json['quoteVolume'].toDouble(),
      isFrozen: json['isFrozen'].toDouble(),
      high24hr: json['high24hr'].toDouble(),
      low24hr: json['low24hr'].toDouble(),);
  }
}
