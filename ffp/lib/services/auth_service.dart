import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  //sing in anon
  Future? signInAnon() async {
    try {
      UserCredential result = await _authentication.signInAnonymously();
      User? user = result.user;
      return User;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  //sini in email and password

  //register with email and password

  //sign out
}
