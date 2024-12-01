import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Pages/Registration/SignIn_page.dart';
import '../toast.dart';

class FirebaseeAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Future<void> _addUserData(User user, {String? username}) async {
    try {
      await _firestore.collection('Users').doc(user.uid).set({
        'userId': user.uid,
        'Email': user.email ?? '',
        'Name': username ?? user.displayName ?? 'Anonymous',
        'profilePhoto': user.photoURL ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      }).then((onValue){
          FirebaseFirestore.instance.collection('UserProgress').doc(user.uid).set({
        'progress': 0, // Initialize progress to 0
        "total_score":0,
        'level1_score':0,
        'level2_score':0,
        'level3_score':0,
        'level4_score':0,
        'timestamp': FieldValue.serverTimestamp(),
      });
      });
    } catch (e) {
      showToast(message: 'Error saving user data: $e');
    }
  }

  Future<User?> signUpWithEmailAndPassword(
    String email, String password, String username) async {
  try {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Ensure data is saved before proceeding
    await _addUserData(credential.user!, username: username);

    // Fetch user data after successful creation
    await FirebaseFirestore.instance.collection('Users').doc(credential.user!.uid).get().then((doc) {
      
      if (!doc.exists) {
        throw Exception("User data not found after creation.");
      }
    });

    return credential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      showToast(message: 'The email address is already in use.');
    } else {
      showToast(message: 'An error occurred: ${e.code}');
    }
  } catch (e) {
    showToast(message: 'Sign-up failed: $e');
  }
  return null;
}


  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-email') {
        showToast(message: 'Invalid email');
      } else if (e.code == 'wrong-password') {
        showToast(message: 'Invalid password.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

  Future<bool> signinWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.additionalUserInfo!.isNewUser) {
        await _addUserData(userCredential.user!);
      }
      return true;
    } catch (e) {
      showToast(message: 'Google sign-in failed: $e');
      return false;
    }
  }

  Future<bool> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status != LoginStatus.success) return false;

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      UserCredential userCredential =
          await _auth.signInWithCredential(facebookAuthCredential);

      if (userCredential.additionalUserInfo!.isNewUser) {
        await _addUserData(userCredential.user!);
      }
      return true;
    } catch (e) {
      showToast(message: 'Facebook sign-in failed: $e');
      return false;
    }
  }

 Future<void> logOut(BuildContext context) async {
  try {
    final AccessToken? fbToken = await FacebookAuth.instance.accessToken;
    if (fbToken != null) {
      await FacebookAuth.instance.logOut();
    }

    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
    }

    await _auth.signOut();

    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SignIn()),
      (_) => false,
    );

    showToast(message: "Successfully signed out");
  } catch (e) {
    showToast(message: "Log out failed: $e");
  }
}

}
