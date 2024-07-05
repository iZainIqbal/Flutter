import 'package:blockchainapp_using_getx/models/coin_data.dart';

class CurrenciesListAPIResponse {
  List<CoinData>? data;
  Status? status;
  Meta? meta;

  CurrenciesListAPIResponse({this.data, this.status, required this.meta});

  CurrenciesListAPIResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CoinData>[];
      json['data'].forEach((v) {
        data!.add(CoinData.fromJson(v));
      });
    }
    status = json['status'] != null ? status.fromJson(json['status']) : null;
    meta = json['meta'] != null ? meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}
