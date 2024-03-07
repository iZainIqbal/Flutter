import 'package:firebase_app/presentation/post/post_screen..dart';
import 'package:firebase_app/utils/utils.dart';
import 'package:firebase_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationID;
  const VerifyCodeScreen({super.key, required this.verificationID});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool loading = false;
  final verfiyCodeController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void verifyCode() async {
    setState(() {
      loading = true;
    });
    final credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationID,
      smsCode: verfiyCodeController.text.toString(),
    );
    try {
      await _auth.signInWithPhoneNumber(
        credential.toString(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PostScreen(),
        ),
      );
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      Utils().toastmessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Verify Code',
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
              controller: verfiyCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter 6 Digit Code',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Button(
              title: 'Verify Code',
              loading: loading,
              onTap: () {
                verifyCode();
              },
            )
          ],
        ),
      ),
    );
  }
}
