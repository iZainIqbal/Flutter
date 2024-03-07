import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newapp/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = response.body;
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

  @override
  Future<dynamic> getPostApiResponse(String url) async {}

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      // dynamic responseJson = JsonDecoder(response);
    }
  }
}
