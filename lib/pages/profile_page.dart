import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameProvider = Provider.of<TextProvider>(context);

    return Text(nameProvider.name);
  }
}
