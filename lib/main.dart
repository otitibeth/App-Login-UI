import 'package:flutter/material.dart';

import './screens/forgot_password_screen.dart';
import './screens/register_screen.dart';
import './screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page mock',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const LoginScreen(),
      routes: {
        RegisterScreen.routeName: (ctx) => const RegisterScreen(),
        ForgotPasswordScreen.routeName: (ctx) => const ForgotPasswordScreen(),
      },
    );
  }
}

// class LoginUI extends StatelessWidget {
//   const LoginUI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const LoginScreen();
//   }
// }
