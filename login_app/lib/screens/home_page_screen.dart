import 'package:flutter/material.dart';

import '../widgets/loging_form.dart';

import 'package:provider/provider.dart';
import '../providers/users_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routName = '/home-page';
  @override
  Widget build(BuildContext context) {
    final UsersData _usersData = Provider.of<UsersData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('App Name'),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                const Text('/'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/background.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          color: const Color.fromARGB(190, 255, 255, 255),
          child: LogInForm(usersData: _usersData),
        ),
      ),
    );
  }
}
