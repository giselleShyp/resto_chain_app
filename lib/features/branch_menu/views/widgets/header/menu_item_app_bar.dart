import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/controllers/bottom_nav_controller.dart';
import 'package:resto_chain_app/core/controllers/cart_controller.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class MenuItemAppBar extends StatelessWidget {
  const MenuItemAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartController>();

    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      pinned: true,
      title: AppText(
        title,
        contentStyle: ContentStyle.titleLarge,
        fontWeight: FontWeight.w500,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: AppSpacing.md),
          child: Obx(
            () => InkWell(
              onTap: () {
                final nav = Get.find<BottomNavController>();
                nav.changeIndex(2);

                Get.offAllNamed(AppRoutes.base);
              },
              child: Badge(
                backgroundColor: cart.cartCount != 0
                    ? AppColors.primary
                    : Colors.transparent,
                label: Visibility(
                  visible: cart.cartCount != 0,
                  child: AppText(
                    cart.cartCount.toString(),
                    contentColor: AppColors.onPrimary,
                    contentStyle: ContentStyle.labelSmall,
                  ),
                ),
                child: const Icon(CupertinoIcons.cart),
              ),
            ),
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: Colors.grey.withValues(alpha: 0.2),
        ),
      ),
    );
  }
}
