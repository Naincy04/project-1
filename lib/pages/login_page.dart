import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _myController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String enteredText = _myController.text;
                Provider.of<TextProvider>(context, listen: false)
                    .setEnteredText(enteredText);
                _myController.clear();
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
