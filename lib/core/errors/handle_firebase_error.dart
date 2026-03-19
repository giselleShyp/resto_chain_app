import 'package:firebase_auth/firebase_auth.dart';

String handleFirebaseError(dynamic error) {
  if (error is FirebaseException) {
    switch (error.code) {
      case 'permission-denied':
        return "Access denied. You don't have permission to view this data.";
      case 'unavailable':
        return "Service is temporary unavailable. Please check your internet.";
      case 'not-found':
        return "The requested information was not found.";
      case 'failed-precondition':
        return "Query requires a database index. Check the console for the link.";
      default:
        return "Database error: ${error.message}";
    }
  } else if (error is FirebaseAuthException) {
    // You can even handle Auth errors here if you want a truly global helper
    return error.message ?? "Authentication failed.";
  }

  return "An unexpected error occurred. Please try again.";
}
