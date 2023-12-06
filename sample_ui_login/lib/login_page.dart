import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Sign In Bar
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Email Text field
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person_2_rounded),
                  labelText: 'Email or User Name',
                ),
              ),

              // Password Text Field

              // forgot Password

              // Sign In Button

              //  or sign In

              // Google Sign In + facebook + X + In

              // dont have Account
            ],
          ),
        ),
      ),
    );
  }
}
