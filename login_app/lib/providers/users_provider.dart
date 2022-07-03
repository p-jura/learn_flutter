import 'package:flutter/cupertino.dart';

enum AccountType {
  admin,
  user,
  unregistered,
}

class UserAccount {
  final String? userEmail;
  final String? userPassword;
  final AccountType? accountType;

  final UserInformation userInformation;
  UserAccount(
      {required this.userEmail,
      required this.userPassword,
      required this.userInformation,
      required this.accountType});
}

class UserInformation {
  final String? userName;
  final String? userSurname;
  final int? userAge;
  final String? userAdress;
  UserInformation(
      {this.userName, this.userSurname, this.userAge, this.userAdress});
}

class UsersData with ChangeNotifier {
  final List<UserAccount> _usersData = [
    UserAccount(
        userEmail: 'test1@gmail.com',
        userPassword: '123',
        userInformation: UserInformation(),
        accountType: AccountType.admin),
    UserAccount(
        userEmail: 'test2@gmail.com',
        userPassword: 'qwe',
        userInformation: UserInformation(
          userName: 'Marta',
          userAge: 25,
        ),
        accountType: AccountType.user),
  ];
  List<UserAccount> get usersData {
    return [..._usersData];
  }

  UserAccount? searchForUserAccont(String email) {
    for (var userAcc in _usersData) {
      if (userAcc.userEmail == email) {
        return userAcc;
      }
    }
    return null;
  }
}
