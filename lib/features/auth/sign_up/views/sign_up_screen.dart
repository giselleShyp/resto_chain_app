import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_chain_app/core/constants/app_assets.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/buttons/app_button.dart';
import 'package:resto_chain_app/core/widgets/buttons/app_text_button.dart';
import 'package:resto_chain_app/core/widgets/label_text.dart/app_label_text.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/core/widgets/textfield/app_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.md.all,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _LoginHeader(),
                _LoginForm(),
                _LoginFooter(),
              ],
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

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLabelText(label: "Full Name"),
        Gaps.h4,
        AppTextFormField(
          hintText: "Giselle",
        ),
        Gaps.h16,
        AppLabelText(label: "Email"),
        Gaps.h4,
        AppTextFormField(
          hintText: "giselle@gmail.com",
        ),
        Gaps.h16,
        AppLabelText(label: "Password"),
        Gaps.h4,
        AppTextFormField(
          hintText: "*******",
        ),
        Gaps.h24,
        AppButton(
          variation: ButtonVariation.primary,
          label: "Create Account",
          onPressed: () {},
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
              label: "Already have an account? ",
            ),
            AppTextButton(
              text: "Sign In",
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
