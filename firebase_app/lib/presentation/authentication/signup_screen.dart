import 'package:firebase_app/presentation/home/chat_screen.dart';
import 'package:firebase_app/services/database.dart';
import 'package:firebase_app/services/shared_pref.dart';
import 'package:firebase_app/utils/utils.dart';
import 'package:firebase_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signUp() async {
    setState(() {
      loading = true;
    });

    if (password == confirmPassword) {
      _auth
          .createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      )
          .then((value) {
        setState(() {
          loading = false;
        });
        Utils().toastmessage(value.user!.email.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
      }).onError((error, stackTrace) {
        setState(() {
          loading = false;
        });
        Utils().toastmessage(error.toString());
      });

      String id = randomAlphaNumeric(10);

      Map<String, dynamic> userInfo = {
        "Name": nameController.text.toString(),
        "Email": emailController.text.toString(),
        "Username":
            emailController.text.toString().replaceAll('@gmail.com', ""),
        "Photo":
            "https://media.licdn.com/dms/image/D4D03AQGU4gCmVknW6w/profile-displayphoto-shrink_800_800/0/1708521359633?e=1715817600&v=beta&t=Nv-htxJNNuLb98b9CAqd8EWS6f9dTI4Rc5eMWPLgUbA",
        "Id": id,
      };

      await DatabaseMethods().addUserDetails(userInfo, id);
      await SharedPreferencesHelper().saveUserId(id);
      await SharedPreferencesHelper()
          .saveDisplayName(nameController.text.toString());
      await SharedPreferencesHelper()
          .saveuserEmail(emailController.text.toString());
      await SharedPreferencesHelper().saveuserName(
          emailController.text.toString().replaceAll('@gmail.com', ""));
      await SharedPreferencesHelper().saveuserPhoto(
          "https://media.licdn.com/dms/image/D4D03AQGU4gCmVknW6w/profile-displayphoto-shrink_800_800/0/1708521359633?e=1715817600&v=beta&t=Nv-htxJNNuLb98b9CAqd8EWS6f9dTI4Rc5eMWPLgUbA");
    }
    {
      Utils().toastmessage('Password does not match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          title: const Text(
            'Signup',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.person_outlined),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your Name' : null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter Email' : null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_outlined),
                      ),
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? 'Enter Password' : null,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_outlined),
                      ),
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? 'Confirm Password' : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Button(
                  title: 'Sign Up',
                  loading: loading,
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      signUp();
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
