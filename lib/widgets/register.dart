import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:gdsc_bppimt/pages/auth.dart';
import 'package:gdsc_bppimt/pages/home_page.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  String? errorMessage = '';

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        name: _controllerName.text,
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      print("Successfully registerd");
      // After a successful registration, navigate to the home page
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
      children: <Widget>[
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
        TextField(
          controller: _controllerName,
          onChanged: (name) {
            Provider.of<TextProvider>(context, listen: false).setName(name);
          },
          decoration: const InputDecoration(
            hintText: "Enter Name",
          ),
        ),
        ElevatedButton(
          onPressed: createUserWithEmailAndPassword,
          child: const Text('Login'),
        ),
      ],
    );
  }
}
