import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:provider/provider.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<TextProvider>(context).email);
  }
}
