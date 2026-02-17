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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthController _controller = Get.find();

  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    debugPrint("Start Create Account");
    final result = await _controller.register(
      name,
      email,
      password,
    );

    if (result.isSuccess) {
      AppSnackbar.success(result.message);
      Get.offAllNamed(AppRoutes.base);
    } else {
      AppSnackbar.error(result.message);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
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
                    _RegisterHeader(),
                    _RegisterForm(
                      nameController: _nameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      controller: _controller,
                      onSubmit: () async {
                        if (!_formKey.currentState!.validate()) return;

                        await createAccount(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      },
                    ),
                    _RegisterFooter(),
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

class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

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
          "Create Account",
          contentStyle: ContentStyle.headlineSmall,
          fontWeight: FontWeight.w600,
        ),
        AppLabelText(
          label: "Join RestoChain today",
        ),
        Gaps.h16,
      ],
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    required this.controller,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLabelText(label: "Full Name"),
        Gaps.h4,
        AppTextFormField(
          controller: nameController,
          hintText: "Giselle",
          validator: AuthValidators.nameValidator,
        ),
        Gaps.h16,
        AppLabelText(label: "Email"),
        Gaps.h4,
        AppTextFormField(
          controller: emailController,
          hintText: "giselle@gmail.com",
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
                    label: "Create Account",
                    onPressed: () {
                      debugPrint("Create Account1");
                      if (controller.isLoading.value == true) return;
                      debugPrint("Create Account2");
                      onSubmit();
                    },
                  ),
          ),
        ),
      ],
    );
  }
}

class _RegisterFooter extends StatelessWidget {
  const _RegisterFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.h24,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLabelText(
              label: "Already have an account? ",
            ),
            AppTextButton(
              text: "Sign In",
              onPressed: () {
                Get.offNamed('/login');
              },
            ),
          ],
        ),
      ],
    );
  }
}
