import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<TextProvider>(context).enteredText);
  }
}
