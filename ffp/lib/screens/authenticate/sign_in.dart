import 'package:ffp/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text("Sign In"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: ElevatedButton(
          onPressed: () async {
            dynamic user = await _authService.signInAnon();
            print(user.toString());
          },
          child: const Text(
            'Sign In',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
