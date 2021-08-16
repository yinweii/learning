import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthRepository {
  FirebaseAuth _firebaseAuth;

  AuthRepository() {
    this._firebaseAuth = FirebaseAuth.instance;
  }
  //create new user
  Future<User> createUser(String email, String password) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }

  // user login
  Future<User> userSignIn(String email, String password) async {
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }

  //sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  //check is signIn
  Future<bool> isSignIn() async {
    var currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  //get current user
  Future<User> getCurrentUser() async {
    return await _firebaseAuth.currentUser;
  }
}
