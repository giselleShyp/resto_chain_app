import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/constants/app_assets.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/layouts/main/main_layout.dart';
import 'package:resto_chain_app/core/routes/routes_names.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/animated_grid_view/animated_grid_view.dart';
import 'package:resto_chain_app/core/widgets/restaurant_card/restaurant_card.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/core/widgets/textfield/app_text_form_field.dart';
import 'package:resto_chain_app/features/restaurants/controllers/restaurant_controller.dart';
import 'package:resto_chain_app/features/restaurants/views/state_views/restaurants_empty_screen.dart';
import 'package:resto_chain_app/features/restaurants/views/state_views/restaurants_error_screen.dart';
import 'package:resto_chain_app/features/restaurants/views/state_views/restaurants_loading_screen.dart';

class RestaurantsScreen extends StatelessWidget {
  RestaurantsScreen({super.key});

  final controller = Get.put(RestaurantController());
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      header: _buildHeader(),
      body: _buildBody(controller: controller),
    );
  }
}

Widget _buildHeader() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Deliver to',
                contentStyle: ContentStyle.bodyMedium,
                contentColor: AppColors.textSecondary,
              ),
              AppText(
                '123 Main Street',
                contentStyle: ContentStyle.bodyLarge,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          CircleAvatar(
            child: SvgPicture.asset(
              AppAssets.logo,
            ),
          ),
        ],
      ),
      Gaps.h16,
      AppTextFormField(
        hintText: 'Search restaurants...',
        prefixIcon: CupertinoIcons.search,
      ),
    ],
  );
}

Widget _buildBody({
  required RestaurantController controller,
}) {
  return Expanded(
    child: Obx(
      () {
        switch (controller.state.value) {
          case ViewState.loading:
            return RestaurantsLoadingScreen();

          case ViewState.error:
            return RestaurantsErrorScreen(
              message: controller.errorMessage.value ?? "Something went wrong",
            );

          case ViewState.empty:
            return RestaurantsEmptyScreen(message: "No restaurants available");
          case ViewState.success:
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
              child: AnimationLimiter(
                child: GridView.builder(
                  // padding: const EdgeInsets.all(AppRadius.md),
                  itemCount: controller.restaurants.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final restaurant = controller.restaurants[index];

                    return AnimatedGridView(
                      position: index,
                      columnCount: 2,
                      verticalOffset: 50.0,
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 250),
                      child: RestaurantCard(
                        key: ValueKey(index),
                        logoUrl: restaurant.logoUrl,
                        restaurantName: restaurant.name,
                        restaurantDescription: restaurant.description,
                        index: index,
                        onTap: () {
                          Get.toNamed(AppRoutes.branches,
                              arguments: restaurant);
                        },
                      ),
                    );
                  },
                ),
              ),
            );
        }
      },
    ),
  );
}
