import 'package:flutter/material.dart';
import 'package:gdsc_bppimt/main.dart';
import 'package:gdsc_bppimt/pages/login_page.dart';
import 'package:gdsc_bppimt/pages/profile_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Google Developer Student Clubs",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 17),
        ),
        actions: <Widget>[
          Consumer<TextProvider>(
            builder: (context, textProvider, _) {
              return textProvider.enteredText.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'profile') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfilePage()));
                          } else if (value == 'logout') {
                            LogoutFunction(context);
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
                          backgroundColor: Colors.black,
                          child: Text(
                            textProvider.enteredText
                                .substring(0, 1)
                                .toUpperCase(),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Icon(
                        Icons.login,
                        color: Colors.black,
                      ),
                    );
            },
          )
        ],
      ),
    );
  }

  void LogoutFunction(BuildContext context) {
    // Perform logout actions here, such as clearing session data, resetting authentication, etc.

    // Example: Clearing user session data
    // UserSession.clear(); // Custom function to clear session

    // Navigate to the login page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false, // Clear all routes in stack
    );
  }
}
