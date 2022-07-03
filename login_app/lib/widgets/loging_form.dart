import 'package:flutter/material.dart';
import 'package:login_app/providers/users_provider.dart';
import 'package:login_app/screens/Loged_in_screen.dart';
import 'package:provider/provider.dart';

import '../providers/users_provider.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({required this.usersData, Key? key}) : super(key: key);

  final UsersData usersData;

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  UserAccount? matchedUserAccount;

  bool submitLoginAndPassword() {
    _formKey.currentState!.validate();

    if (validateAccount(_emailController.text, _passwordController.text)) {
      matchedUserAccount = widget.usersData.searchForUserAccont(_emailController.text);
      Navigator.of(context).pushNamed(UserAccountHomePage.routName, arguments: matchedUserAccount);
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _passwordFocus.dispose();
    super.dispose();
  }

  bool validateAccount(String email, String passord) {
    matchedUserAccount = widget.usersData.searchForUserAccont(email);
    if (matchedUserAccount == null) {
      return false;
    } else {
      if (matchedUserAccount!.userPassword == passord) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        height: 350,
        child: Card(
          margin: const EdgeInsets.all(5),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Log in',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24),
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocus);
                    },
                    validator: (emailValidator) {
                      if (emailValidator == null) {
                        return 'value is null';
                      } else if (emailValidator.isEmpty) {
                        return 'email field is empty';
                      } else if (!emailValidator.contains('@')) {
                        return 'uncorrect email.';
                      } else if (validateAccount(
                          _emailController.text, _passwordController.text)) {
                        return null;
                      }
                      return 'Uncorrect email adress or password';
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 221, 221, 221),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Email adress',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (passwordValidator) {
                      if (passwordValidator == null) {
                        return 'value is null';
                      } else if (passwordValidator.isEmpty) {
                        return 'password field is empty';
                      } else if (validateAccount(
                          _emailController.text, _passwordController.text)) {
                        return null;
                      }
                      return 'Uncorrect email adress or password';
                    },
                    controller: _passwordController,
                    onFieldSubmitted: (_) {
                      if (submitLoginAndPassword()) {
                        _formKey.currentState!.reset();
                      }
                    },
                    keyboardType: TextInputType.text,
                    focusNode: _passwordFocus,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 221, 221, 221),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        if (submitLoginAndPassword()) {
                          _formKey.currentState!.reset();
                        }
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('Confirm'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
