import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreenProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isvisible = false;
  bool _loading = false;

  bool get loading => _loading;
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void toggleVisibility() {
    isvisible = !isvisible;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    setloading(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        print('Login Successful');
        setloading(false);
      } else {
        setloading(false);
        print('Login Failed');
      }
    } catch (e) {
      setloading(false);
      print(e.toString());
    }
  }
}
