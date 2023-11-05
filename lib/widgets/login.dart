import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:gdsc_bppimt/pages/auth.dart';
import 'package:gdsc_bppimt/pages/home_page.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  String? errorMessage = '';

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailandPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Displaying error message
        _errorMessage(),
        TextField(
          controller: _controllerEmail,
          onChanged: (email) {
            Provider.of<TextProvider>(context, listen: false).setEmail(email);
          },
          decoration: const InputDecoration(
            hintText: "Enter Email",
          ),
        ),
        TextField(
          controller: _controllerPassword,
          onChanged: (password) {
            Provider.of<TextProvider>(context, listen: false)
                .setEmail(password);
          },
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Enter Password",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: signInWithEmailAndPassword,
          child: const Text('Login'),
        ),
      ],
    );
  }
}
