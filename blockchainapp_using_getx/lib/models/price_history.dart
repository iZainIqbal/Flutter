class PriceHistory {
  String? symbol;
  List<PriceData>? prices;

  PriceHistory({this.symbol, this.prices});

  PriceHistory.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    if (json['prices'] != null) {
      prices = <PriceData>[];
      json['prices'].forEach((v) {
        prices!.add(PriceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = this.symbol;
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PriceData {
  String? date;
  double? price;

  PriceData({this.date, this.price});

  PriceData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    price = json['price']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = this.date;
    data['price'] = this.price;
    return data;
  }
}
