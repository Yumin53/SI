import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firestore.dart';

class FireauthService {
  final double errorFontSize = 18.0;

  void displayError(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: errorFontSize,
    );
  }
  Future<void> googleSignin (BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) return;

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        FirestoreService().addUser(
            user.email ?? 'google@gmail.com',
            user.displayName ?? 'Google'
        );
      }
      if (context.mounted) Navigator.pop(context);
    } catch (e) {
      if (context.mounted) Navigator.pop(context);
      displayError(e.toString());
    }
  }

  Future<void> signup ({
    required String name,
    required String email,
    required String password,
    required String confirmPw,
    required BuildContext context,
  }) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      if (password != confirmPw) {
        throw Exception('Passwords don\'t match!');
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      if (context.mounted) Navigator.pop(context);

      FirestoreService().addUser(email, name);

    } on FirebaseAuthException catch (e) {
      if (context.mounted) Navigator.pop(context);
      String message = '';
      if (e.message != null) {
        message = e.message!;
      } else {
        message = 'Unknown error';
      }
      displayError(message);

    } catch (e) {
      if (context.mounted) Navigator.pop(context);
      displayError(e.toString());
    }
  }

  Future<void> signin ({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) Navigator.pop(context);
      String message = '';
      if (e.message != null) {
        message = e.message!;
      } else {
        message = 'Unknown error';
      }

      displayError(message);
    }
  }

  void signout (BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    FirebaseAuth.instance.signOut();
    if (context.mounted) Navigator.pop(context);
  }
}