import 'package:firebase_app/presentation/authentication/login_screen.dart';

import 'package:firebase_app/services/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase App'),
        ),
        body: const LoginScreen(),
      ),
    );
  }
}
