import 'package:flutter/material.dart';
import 'package:login_page_ui/screens/home_screen.dart';
import 'package:login_page_ui/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _passwordController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Center(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText('JOIN US!'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'LOgIfY',
                  style: TextStyle(
                      fontFamily: 'Charm',
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.deepOrange),
                ),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                  Text('SIGN UP!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent)),
                ]),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      label: Text('Name'),
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder()),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_emailFocusNode),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter first name and surname';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      label: Text('Email Adress'),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()),
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email!';
                    }
                    if (!value.endsWith('@gmail.com') ||
                        !value.endsWith('@yahoo.com')) {
                      return 'Enter a Gmail or a Yahoo mail';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _passwordFocusNode,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context)
                        .requestFocus(_confirmPasswordFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Create Password';
                    }
                    // if (!value.contains() //one capslock
                    //     &&
                    //     !value.contains() //one numer
                    //     &&
                    //     !value.contains()) // one other character
                    // {
                    //   return 'Enter atleast 1 capital letter, 1 number and one character';
                    // }
                    if (double.parse(value) <= 9) {
                      return 'password must contain atleast 10 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    label: Text('Confirm Password'),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  focusNode: _confirmPasswordFocusNode,
                  validator: (value) {
                    if (value != _passwordController) {
                      return 'Passwords don\'t match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    },
                    child: const Text('SIGN UP'),
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
                const SizedBox(height: 15),
                const Divider(height: 30, color: Colors.black87),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have An Account?',
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
