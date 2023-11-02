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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Google Developer Student Clubs",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 10),
        ),
        actions: <Widget>[
          Consumer<TextProvider>(
            builder: (context, textProvider, _) {
              return textProvider.email.isNotEmpty
                  ? PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'profile') {
                          print("profile clicked");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()));
                        } else if (value == 'logout') {
                          print("logout");
                          logOutFunction(context);
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
                          textProvider.email.substring(0, 1).toUpperCase(),
                        ),
                      ),
                    )
                  : ElevatedButton(
                      child: const Icon(Icons.login),
                      onPressed: () {
                        print("HEllooooooooo");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                    );
            },
          )
        ],
      ),
    );
  }

  void logOutFunction(BuildContext context) {
    // Perform logout actions here, such as clearing session data, resetting authentication, etc.

    // Example: Clearing user session data
    // UserSession.clear(); // Custom function to clear session

    // Navigate to the login page
    // Clear all routes in stack
    ElevatedButton(
      onPressed: signOut,
      child: const Text("Sign Out"),
    );
  }
}
