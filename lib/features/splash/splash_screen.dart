import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_chain_app/core/constants/app_assets.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();

  //   FirebaseAuth.instance.authStateChanges().listen((user) {
  //     if (user != null) {
  //       Get.offAllNamed(AppRoutes.base);
  //     } else {
  //       Get.offAllNamed(AppRoutes.login);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.lg,
          children: [
            SvgPicture.asset(
              AppAssets.logo,
              width: 100,
              height: 100,
            ),
            AppText(
              'RestoChain',
              contentColor: AppColors.surface,
              contentStyle: ContentStyle.headlineLarge,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              'Your favorite restaurants, one tap away',
              contentColor: AppColors.surface,
              contentStyle: ContentStyle.labelLarge,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
