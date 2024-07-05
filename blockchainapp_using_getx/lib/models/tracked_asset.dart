import 'package:blockchainapp_using_getx/models/coin_data.dart';

class TrackedAssets {
  List<String>? symbols;
  List<CoinData>? assets;

  TrackedAssets({this.symbols, this.assets});

  TrackedAssets.fromJson(Map<String, dynamic> json) {
    symbols = json['symbols']?.cast<String>();
    if (json['assets'] != null) {
      assets = <CoinData>[];
      json['assets'].forEach((v) {
        assets!.add(CoinData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbols'] = this.symbols;
    if (this.assets != null) {
      data['assets'] = this.assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
