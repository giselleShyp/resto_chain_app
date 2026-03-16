import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/controllers/bottom_nav_controller.dart';
import 'package:resto_chain_app/core/models/result_model.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/features/auth/errors/auth_error_mapper.dart';
import 'package:resto_chain_app/features/auth/models/user_model.dart';
import 'package:resto_chain_app/features/auth/services/auth_service.dart';
import 'package:resto_chain_app/features/cart/controllers/cart_controller.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  // var currentUser = Rxn<UserModel>();
  Rxn<UserModel> currentUser = Rxn<UserModel>();

  var isLoading = false.obs;

  @override
  void onInit() {
    _authService.authStateChanges.listen(_handleAuthChanged);
    super.onInit();
  }

  Future<void> _handleAuthChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      currentUser.value = null;
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    await loadUser(firebaseUser.uid);
    Get.offAllNamed(AppRoutes.base);
  }

  Future<void> loadUser(String uid) async {
    try {
      isLoading.value = true;
      final userModel = await _authService.getUser(uid);
      currentUser.value = userModel;
    } finally {
      isLoading.value = false;
    }
  }

  Future<ResultModel<UserModel>> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      isLoading.value = true;

      debugPrint("name :$name");
      debugPrint("email :$email");
      debugPrint("password :$password");

      final registerUserResult = await _authService.register(
        name: name,
        email: email,
        password: password,
      );

      currentUser.value = registerUserResult;

      return ResultModel.success(
        message: "Account created successfully",
        data: registerUserResult,
      );
    } on FirebaseAuthException catch (e) {
      final failure = AuthErrorMapper.fromFirebaseException(e);
      return ResultModel.failure(
        message: failure.message,
      );
    } catch (_) {
      return ResultModel.failure(
        message: 'Unexpected error occurred.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<ResultModel<UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final loginUserResult = await _authService.login(
        email: email,
        password: password,
      );
      currentUser.value = loginUserResult;

      return ResultModel.success(
        message: 'Welcome back ${loginUserResult.name}',
        data: loginUserResult,
      );
    } on FirebaseAuthException catch (e) {
      final failure = AuthErrorMapper.fromFirebaseException(e);
      return ResultModel.failure(
        message: failure.message,
      );
    } catch (_) {
      return ResultModel.failure(
        message: 'Unexpected error occurred.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final bottomNavController = Get.find<BottomNavController>();
    final cartController = Get.find<CartController>();
    bottomNavController.changeIndex(0);
    cartController.cartItems.value = [];
    await _authService.signOut();
    currentUser.value = null;
  }
}
