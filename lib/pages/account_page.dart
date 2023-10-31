import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<TextProvider>(context).enteredText);
  }
}
