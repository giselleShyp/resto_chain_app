import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/buttons/app_button.dart';
import 'package:resto_chain_app/features/profile/views/widgets/profile_items/profile_items.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/auth/presentation/controllers/auth_controller.dart';

class ProfileScreen extends GetView<AuthController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            final user = controller.currentUser.value;

            if (user == null) {
              return const Center(child: AppText("No user data"));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.h32,
                _profileHeaderTitle(),
                Gaps.h16,
                _profileContainerInfo(
                  userName: user.name,
                  email: user.email,
                ),
                Gaps.h20,
                Padding(
                  padding: AppSpacing.md.horizontal,
                  child: Column(
                    children: [
                      ProfileItems(
                        onEditProfileTap: () {},
                        onSavedAddressTap: () {},
                        onFavoriteTap: () {},
                        onOrderHistoryTap: () {},
                      ),
                      Gaps.h20,
                      AppButton(
                        variation: ButtonVariation.primaryOutline,
                        label: "Sign Out",
                        onPressed: () async {
                          await controller.logout();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _profileHeaderTitle() {
  return Padding(
    padding: AppSpacing.md.horizontal,
    child: AppText(
      "Profile",
      contentStyle: ContentStyle.titleLarge,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget _profileContainerInfo({
  required String userName,
  required String email,
}) {
  return Container(
    padding: AppSpacing.lg.vertical,
    decoration: BoxDecoration(
      color: AppColors.onPrimary,
      border: Border(
        top: BorderSide(
          color: Colors.grey.withValues(alpha: 0.2),
          width: 1.5,
        ),
        bottom: BorderSide(
          color: Colors.grey.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
    ),
    child: Center(
      child: Column(
        spacing: AppSpacing.sm,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary.withValues(alpha: 0.3),
            radius: 25,
            child: AppText(
              userName[0],
              contentStyle: ContentStyle.titleLarge,
              contentColor: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppText(
            userName,
            contentStyle: ContentStyle.titleMedium,
            fontWeight: FontWeight.w500,
          ),
          AppText(
            email,
            contentStyle: ContentStyle.titleSmall,
            contentColor: AppColors.textSecondary,
          ),
        ],
      ),
    ),
  );
}
