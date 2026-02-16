import 'package:firebase_auth/firebase_auth.dart';
import 'package:resto_chain_app/features/auth/errors/auth_failure.dart';

class AuthErrorMapper {
  static AuthFailure fromFirebaseException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return AuthFailure('No user found with this email.');

      case 'wrong-password':
        return AuthFailure('Incorrect password. Please try again.');

      case 'invalid-email':
        return AuthFailure('The email address is invalid.');

      case 'email-already-in-use':
        return AuthFailure('This email is already registered.');

      case 'weak-password':
        return AuthFailure('Password should be at least 6 characters.');

      case 'network-request-failed':
        return AuthFailure('No internet connection.');

      case 'too-many-requests':
        return AuthFailure('Too many attempts. Try again later.');

      default:
        return AuthFailure('Something went wrong. Please try again.');
    }
  }
}
