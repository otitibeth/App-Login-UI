import 'package:flutter/material.dart';
import 'package:login_page_ui/screens/home_screen.dart';

import './forgot_password_screen.dart';
import './register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _form = GlobalKey();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Widget buildText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.deepOrangeAccent,
              letterSpacing: 2),
        ),
      ],
    );
  }

  void _saveForm() {
    _form.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Welcome Back',
      //     style: TextStyle(fontWeight: FontWeight.w900),
      //   ),
      // ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Column(
                    children: [
                      buildText('WELCOME'),
                      buildText('BACK!'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'LOgIfY',
                    style: TextStyle(
                        fontFamily: 'Charm',
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepOrange),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text('LOGIN!',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent)),
                      ]),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text('Email Address'),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email!';
                      }
                      if (!value.endsWith('@gmail.com') ||
                          !value.endsWith('@yahoo.com')) {
                        return 'Enter a registered email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                    focusNode: _passwordFocusNode,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ForgotPasswordScreen.routeName);
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(colors: [
                        Colors.amberAccent,
                        Colors.yellow,
                        Colors.deepOrange
                      ]),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(HomeScreen.routeName);
                      },
                      child: const Text(
                        'LOGIN',
                        // style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.fingerprint,
                      size: 60,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(height: 30, color: Colors.black87),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Here?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RegisterScreen.routeName);
                        },
                        child: const Text('Register Account'),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
