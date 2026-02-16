import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/features/auth/errors/auth_error_mapper.dart';
import 'package:resto_chain_app/features/auth/models/auth_result.dart';
import 'package:resto_chain_app/features/auth/models/user_model.dart';
import 'package:resto_chain_app/features/auth/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService authService = AuthService();

  var isLoading = false.obs;
  var currentUser = Rxn<UserModel>();

  Future<AppResult<UserModel>> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      isLoading.value = true;

      debugPrint("name :$name");
      debugPrint("email :$email");
      debugPrint("password :$password");

      final registerUserResult = await authService.register(
        name: name,
        email: email,
        password: password,
      );

      currentUser.value = registerUserResult;

      return AppResult.success(
        message: "Account created successfully",
        data: registerUserResult,
      );
    } on FirebaseAuthException catch (e) {
      final failure = AuthErrorMapper.fromFirebaseException(e);
      return AppResult.failure(
        message: failure.message,
      );
    } catch (_) {
      return AppResult.failure(
        message: 'Unexpected error occurred.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<AppResult<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final loginUserResult = await authService.login(
        email: email,
        password: password,
      );
      currentUser.value = loginUserResult;

      return AppResult.success(
        message: 'Welcome back ${loginUserResult.name}',
        data: loginUserResult,
      );
    } on FirebaseAuthException catch (e) {
      final failure = AuthErrorMapper.fromFirebaseException(e);
      return AppResult.failure(
        message: failure.message,
      );
    } catch (_) {
      return AppResult.failure(
        message: 'Unexpected error occurred.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await authService.signOut();
    currentUser.value = null;
  }
}
