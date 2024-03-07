import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider extends ChangeNotifier {
  Future<void> login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        print('Login Successful');
      } else {
        print('Login Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
