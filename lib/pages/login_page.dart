import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:gdsc_bppimt/widgets/login.dart';
import 'package:gdsc_bppimt/widgets/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;
  late TextProvider textProvider;
  String? errorMessage = '';

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          // Toggling between login and register
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin
          ? 'Dont have an account? Sign up'
          : 'Alraedy have an account? Sign in'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in Credentials"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            isLogin ? const LoginWidget() : const RegisterWidget(),
            _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}
