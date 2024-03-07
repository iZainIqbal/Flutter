import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/bottomTabs');
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
