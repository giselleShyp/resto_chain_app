import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/constants/app_assets.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/utils/validators/auth_validators.dart';
import 'package:resto_chain_app/core/widgets/buttons/app_button.dart';
import 'package:resto_chain_app/core/widgets/buttons/app_text_button.dart';
import 'package:resto_chain_app/core/widgets/label_text.dart/app_label_text.dart';
import 'package:resto_chain_app/core/widgets/snack_bar/app_snackbar.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/core/widgets/textfield/app_text_form_field.dart';
import 'package:resto_chain_app/features/auth/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthController _controller = Get.find();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final result = await _controller.login(
      email: email,
      password: password,
    );

    if (result.isSuccess) {
      AppSnackbar.success(result.message);
      Get.offAllNamed(AppRoutes.home);
    } else {
      AppSnackbar.error(result.message);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSpacing.md.all,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _LoginHeader(),
                    _LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      controller: _controller,
                      onSubmit: () async {
                        if (!_formKey.currentState!.validate()) return;

                        await login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      },
                    ),
                    _LoginFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.sm,
      children: [
        Gaps.h32,
        SvgPicture.asset(
          AppAssets.logo,
          height: 100,
          width: 100,
        ),
        Gaps.h16,
        AppText(
          "Welcome Back",
          contentStyle: ContentStyle.headlineSmall,
          fontWeight: FontWeight.w600,
        ),
        AppLabelText(
          label: "Sign in to continue",
        ),
        Gaps.h16,
      ],
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    required this.controller,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLabelText(label: "email"),
        Gaps.h4,
        AppTextFormField(
          controller: emailController,
          hintText: "giselle@gmail",
          keyboardType: TextInputType.emailAddress,
          validator: AuthValidators.emailValidator,
        ),
        Gaps.h16,
        AppLabelText(label: "Password"),
        Gaps.h4,
        AppTextFormField(
          controller: passwordController,
          hintText: "*******",
          validator: AuthValidators.passwordValidator,
        ),
        Gaps.h24,
        Obx(
          () => AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : AppButton(
                    variation: ButtonVariation.primary,
                    label: "Login",
                    onPressed: () {
                      debugPrint("login Account1");
                      if (controller.isLoading.value == true) return;
                      debugPrint("login Account2");
                      onSubmit();
                    },
                  ),
          ),
        ),
      ],
    );
  }
}

class _LoginFooter extends StatelessWidget {
  const _LoginFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.h24,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLabelText(
              label: "Don't have an account? ",
            ),
            AppTextButton(
              text: "Register",
              onPressed: () {
                Get.toNamed(AppRoutes.register);
              },
            ),
          ],
        ),
      ],
    );
  }
}
