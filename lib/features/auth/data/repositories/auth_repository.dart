import 'package:firebase_auth/firebase_auth.dart';
import 'package:resto_chain_app/features/auth/data/models/user_model.dart';
import 'package:resto_chain_app/features/auth/data/services/auth_service.dart';

class AuthRepository {
  final AuthService service;

  AuthRepository(this.service);

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) {
    return service.register(
      name: name,
      email: email,
      password: password,
    );
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) {
    return service.login(
      email: email,
      password: password,
    );
  }

  Future<UserModel> getUser({
    required String uid,
  }) {
    return service.getUser(uid);
  }

  Future<void> signOut() {
    return service.signOut();
  }

  Stream<User?> getAuthStateChanges() {
    return service.authStateChanges;
  }
}
