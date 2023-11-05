import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:gdsc_bppimt/pages/auth.dart';
import 'package:gdsc_bppimt/pages/login_page.dart';
import 'package:gdsc_bppimt/pages/profile_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Google Developer Student Clubs",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15),
        ),
        actions: <Widget>[
          Consumer<TextProvider>(
            builder: (context, textProvider, _) {
              return StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData && snapshot.data != null) {
                      return PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'profile') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfilePage()));
                          } else if (value == 'logout') {
                            signOut();
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'profile',
                              child: Text('Profile'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'logout',
                              child: Text('Logout'),
                            ),
                          ];
                        },
                        child: CircleAvatar(
                          child: Text(
                            (textProvider.name.isNotEmpty)
                                ? textProvider.name
                                    .substring(0, 1)
                                    .toUpperCase()
                                : '', // Check if email is not empty
                          ),
                        ),
                      );
                    } else {
                      return ElevatedButton(
                        child: const Icon(Icons.login),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                      );
                    }

                    // Navigate to the home page for authenticated user
                  });
            },
          )
        ],
      ),
    );
  }
}
