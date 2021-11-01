class CryptoItem {
  final int id;
  final String info;
  final String symbol;

  CryptoItem({required this.id, required this.info, required this.symbol});

  factory CryptoItem.fromJson(Map<String, dynamic> json) {
    return CryptoItem(
        id: json['id'], info: json['info'], symbol: json['symbol']);
  }

  @override
  String toString() {
    return '$symbol';
  }
}
