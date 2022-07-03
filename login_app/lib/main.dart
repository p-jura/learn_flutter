import 'package:flutter/material.dart';
import 'package:login_app/providers/users_provider.dart';
import 'package:login_app/screens/Loged_in_screen.dart';
import 'package:login_app/screens/edit_user_accont.dart';
import 'package:provider/provider.dart';

import './screens/home_page_screen.dart';

void main() {
  runApp(const MyAppSettings());
}

class MyAppSettings extends StatelessWidget {
  const MyAppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue.shade600,
          onPrimary: Colors.blue.shade50,
          onPrimaryContainer: Colors.blue.shade200,
          secondary: Colors.yellow.shade400,
          onSecondary: Colors.yellow.shade50,
          error: Colors.red,
          onError: Colors.red.shade100,
          background: Colors.white70,
          onBackground: Colors.white10,
          surface: Colors.white,
          onSurface: Colors.white10,
        ),
      ),
      home: ChangeNotifierProvider(
        create: (_) => UsersData(),
        child: const HomePage(),
      ),
      routes: {
        UserAccountHomePage.routName: (ctx) => const UserAccountHomePage(),
        EditUserAccountScreen.routName: (ctx) => const EditUserAccountScreen(),
      },
    );
  }
}
