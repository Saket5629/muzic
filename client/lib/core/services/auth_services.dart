import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        log('❌ User canceled Google Sign-In');
        return null;
      }

      log('✅ Google account selected: ${googleUser.email}');

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      log('✅ Google credentials obtained');

      // Sign in to Firebase with the Google credential
      final userCredential = await _auth.signInWithCredential(credential);

      log('✅ Signed in to Firebase: ${userCredential.user?.email}');

      return userCredential;
    } on FirebaseAuthException catch (e) {
      log('❌ Firebase Auth Error: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      log('❌ Error signing in with Google: $e');
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
      log('✅ User signed out successfully');
    } catch (e) {
      log('❌ Error signing out: $e');
      rethrow;
    }
  }

  // Delete account
  Future<void> deleteAccount() async {
    try {
      await currentUser?.delete();
      await _googleSignIn.signOut();
      log('✅ Account deleted successfully');
    } catch (e) {
      log('❌ Error deleting account: $e');
      rethrow;
    }
  }

  // Check if user is signed in
  bool isSignedIn() {
    return currentUser != null;
  }

  // Get user display name
  String? getUserDisplayName() {
    return currentUser?.displayName;
  }

  // Get user email
  String? getUserEmail() {
    return currentUser?.email;
  }

  // Get user photo URL
  String? getUserPhotoUrl() {
    return currentUser?.photoURL;
  }

  // Get user ID
  String? getUserId() {
    return currentUser?.uid;
  }

  // Check if this is a new user (useful for showing onboarding)
  bool isNewUser(UserCredential userCredential) {
    return userCredential.additionalUserInfo?.isNewUser ?? false;
  }
}
