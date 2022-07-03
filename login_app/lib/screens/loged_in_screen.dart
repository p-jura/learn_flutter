import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_user_accont.dart';

import '../providers/users_provider.dart';

class UserAccountHomePage extends StatefulWidget {
  const UserAccountHomePage({Key? key}) : super(key: key);
  static const routName = '/loged-in';

  @override
  State<UserAccountHomePage> createState() => _UserAccountHomePageState();
}

class _UserAccountHomePageState extends State<UserAccountHomePage> {
  late final UserAccount _userAccount;
  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments == null) {
      _userAccount = UserAccount(
        userEmail: null,
        userPassword: null,
        userInformation: UserInformation(),
        accountType: null,
      );
    } else {
      _userAccount = ModalRoute.of(context)!.settings.arguments as UserAccount;
    }
    ;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_userAccount.userInformation.userName ?? "Unknown"),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed('/');
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text('User email adress: ${_userAccount.userEmail}'),
                        Text('User account type: ${_userAccount.accountType}')
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                            'User email adress: ${_userAccount.userInformation.userName}'),
                        Text(
                            'User account type: ${_userAccount.userInformation.userSurname}'),
                        Text(
                            'User account type: ${_userAccount.userInformation.userAge}'),
                        Text(
                            'User account type: ${_userAccount.userInformation.userAdress}'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      EditUserAccountScreen.routName,
                      arguments: _userAccount);
                },
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.edit),
                      Text('Edit Data'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
