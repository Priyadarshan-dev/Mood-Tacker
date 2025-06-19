import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/Auth/register_page.dart';

import '../Screens/homepage.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user already Logged in
        if (snapshot.hasData) {
          return Homepage();
        }
        // user not logged in means
        else {
          return RegisterPage();
        }
      },
    );
  }
}
