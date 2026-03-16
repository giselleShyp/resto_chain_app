import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/layouts/main/main_layout.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/buttons/app_button.dart';
import 'package:resto_chain_app/core/widgets/buttons/app_text_button.dart';
import 'package:resto_chain_app/core/widgets/dialog/show_clear_cart_dialog.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/auth/controllers/auth_controller.dart';
import 'package:resto_chain_app/features/cart/controllers/cart_controller.dart';
import 'package:resto_chain_app/features/cart/views/cart_item_card.dart';
import 'package:resto_chain_app/features/cart/views/state_view/cart_screen_empty.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      header: _buildCartHeader(
        onPressed: () async {
          if (controller.cartItems.isEmpty) {
            return;
          }
          final confirm = await showClearCartDialog(context);

          if (confirm == true) {
            controller.clearAll();
          }
        },
      ),
      body: Obx(
        () {
          final userId = authController.currentUser.value?.uid ?? "";

          if (controller.cartItems.isEmpty) {
            return const CartScreenEmpty();
          }
          return _buildCartScreenBody(
            controller,
            userId,
          );
        },
      ),
    );
  }
}

Widget _buildCartHeader({
  required VoidCallback onPressed,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppText(
        'Cart',
        contentStyle: ContentStyle.titleLarge,
        fontWeight: FontWeight.w500,
      ),
      AppTextButton(
        text: "Clear All",
        onPressed: onPressed,
      ),
    ],
  );
}

Widget _buildCartScreenBody(CartController controller, String userId) {
  return Expanded(
    child: Column(
      children: [
        _buildCartItems(controller: controller),
        _buildTotalPriceAndCheckoutButton(
          controller: controller,
          userId: userId,
        ),
      ],
    ),
  );
}

Widget _buildCartItems({
  required CartController controller,
}) {
  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: controller.cartItems.length,
      itemBuilder: (context, index) {
        final cartItem = controller.cartItems[index];

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.sm,
            horizontal: AppSpacing.md,
          ),
          child: CartItemCard(
            item: cartItem.item,
            totalPrice: cartItem.totalPrice,
            count: cartItem.quantity,
            onAdd: () => controller.addItem(item: cartItem.item),
            onRemove: () => controller.removeOne(cartItem.item.id),
            onDelete: () => controller.deleteItem(cartItem.item.id),
          ),
        );
      },
    ),
  );
}

Widget _buildTotalPriceAndCheckoutButton({
  required CartController controller,
  required String userId,
}) {
  return Container(
    padding: EdgeInsets.all(AppSpacing.md),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        top: BorderSide(
          color: Colors.grey.withValues(alpha: 0.4),
        ),
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              "Total",
              contentStyle: ContentStyle.labelLarge,
              contentColor: AppColors.textSecondary,
            ),
            Obx(() => AppText(
                  "${controller.totalPriceAll.toStringAsFixed(2)} \$",
                  contentStyle: ContentStyle.titleLarge,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
        Gaps.h20,
        Obx(
          () => AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : AppButton(
                    variation: ButtonVariation.primary,
                    label: "Checkout",
                    onPressed: () {
                      if (userId.isEmpty) {
                        debugPrint("Can't Checkout because userId is null");
                        return;
                      }
                      controller.checkout(userId: userId);
                    },
                  ),
          ),
        ),
      ],
    ),
  );
}
