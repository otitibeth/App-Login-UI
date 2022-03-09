import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgotPassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'FORGOT PASSWORD',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepOrangeAccent,
                          letterSpacing: 2),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                const Text(
                  'LOgIfY',
                  style: TextStyle(
                      fontFamily: 'Charm',
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.deepOrange),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      label: Text('Email Adress'),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 25),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text('Reset Password'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(colors: [
                      Colors.amberAccent,
                      Colors.yellow,
                      Colors.deepOrange
                    ]),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: const Text('Back to Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
