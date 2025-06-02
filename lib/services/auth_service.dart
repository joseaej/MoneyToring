import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? get currentUser => _auth.currentUser;

  //Register an user with password and email
  static Future<User?> createUserWithPassword(
      String email, String password) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (response.user != null) {
        return response.user!;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }


  //Sign in with password and email
  static Future<User?> siginInWithPassword(
      String email, String password) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user != null) {
        return response.user!;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
