import 'package:flutter/material.dart';

import 'package:login_app/screens/home_page_screen.dart';
import 'package:login_app/screens/loged_in_screen.dart';

import '../providers/users_provider.dart';

class EditUserAccountScreen extends StatefulWidget {
  const EditUserAccountScreen({Key? key}) : super(key: key);
  static const routName = '/edit-user-account';
  @override
  State<EditUserAccountScreen> createState() => _EditUserAccountScreenState();
}

class _EditUserAccountScreenState extends State<EditUserAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final userAccount =
        ModalRoute.of(context)!.settings.arguments as UserAccount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${userAccount.userInformation.userName ?? "Unknown"} account management'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    SizedBox(
                      width: 450,
                      height: 400,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("User account informations"),
                              TextFormField(
                                initialValue:
                                    userAccount.userInformation.userName,
                                decoration: InputDecoration(
                                  labelText: 'User Name',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 199, 199, 199),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                initialValue:
                                    userAccount.userInformation.userSurname,
                                decoration: InputDecoration(
                                  labelText: 'User Surname',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 199, 199, 199),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                initialValue: userAccount
                                    .userInformation.userAge
                                    .toString(),
                                decoration: InputDecoration(
                                  labelText: 'User age',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 199, 199, 199),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                initialValue:
                                    userAccount.userInformation.userAdress,
                                decoration: InputDecoration(
                                  labelText: 'User adres',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 199, 199, 199),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 450,
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("User login informations"),
                              TextFormField(
                                initialValue: userAccount.userEmail,
                                decoration: InputDecoration(
                                  labelText: 'User email',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 199, 199, 199),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                initialValue: userAccount.userPassword,
                                decoration: InputDecoration(
                                  labelText: 'User password',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 199, 199, 199),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
