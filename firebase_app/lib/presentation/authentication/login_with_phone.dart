import 'package:firebase_app/presentation/authentication/verify_code.dart';
import 'package:firebase_app/utils/utils.dart';
import 'package:firebase_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final phoneNumberController = TextEditingController();
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  void loginwihtPhone() {
    setState(() {
      loading = true;
    });
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberController.text,
      verificationCompleted: (_) {
        setState(() {
          loading = false;
        });
      },
      verificationFailed: (e) {
        setState(() {
          loading = false;
        });
        Utils().toastmessage(e.toString());
      },
      codeSent: (String verificationID, int? token) {
        setState(() {
          loading = false;
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyCodeScreen(
                verificationID: verificationID,
              ),
            ));
      },
      codeAutoRetrievalTimeout: (e) {
        setState(() {
          loading = false;
        });
        Utils().toastmessage(e.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Login with Phone ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: '+1 234 3455 345',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Button(
              title: 'Login',
              onTap: () {
                loginwihtPhone();
              },
            ),
          ],
        ),
      ),
    );
  }
}
