import 'package:cloud_firestore/cloud_firestore.dart';

String handleFirestoreError(dynamic error) {
  if (error is FirebaseException) {
    switch (error.code) {
      case 'permission-denied':
        return "You don't have permission to view restaurants.";
      case 'unavailable':
        return "The service is currently unavailable. Check your internet.";
      default:
        return "A database error occurred: ${error.message}";
    }
  }
  return "An unexpected error occurred.";
}
