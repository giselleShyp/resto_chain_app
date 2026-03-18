import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/layouts/main/main_layout.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/animated_grid_view/animated_grid_view.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/orders/presentation/controllers/orders_controller.dart';
import 'package:resto_chain_app/features/orders/presentation/widgets/empty_orders_state.dart';
import 'package:resto_chain_app/features/orders/presentation/widgets/error_orders_state.dart';
import 'package:resto_chain_app/features/orders/presentation/widgets/loading_orders_state.dart';
import 'package:resto_chain_app/features/orders/presentation/widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      header: _buildHeader(),
      body: _buildBody(),
    );
  }
}

Widget _buildHeader() {
  return AppText(
    'My Orders',
    contentStyle: ContentStyle.titleLarge,
    fontWeight: FontWeight.w500,
  );
}

Widget _buildBody() {
  return Obx(
    () {
      final ordersController = Get.find<OrdersController>();

      switch (ordersController.state.value) {
        case ViewState.loading:
          return LoadingOrdersState();

        case ViewState.error:
          return ErrorOrdersState(
            message:
                ordersController.errorMessage.value ?? "Something went wrong",
            onTap: () {
              ordersController.refresh();
            },
          );

        case ViewState.empty:
          return EmptyOrdersState(message: "No Orders Yet");
        case ViewState.success:
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () => ordersController.refresh(),
              child: AnimationLimiter(
                key: UniqueKey(),
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(AppSpacing.md),
                  itemCount: ordersController.orders.length,
                  itemBuilder: (context, index) {
                    final order = ordersController.orders[index];
                    return AnimatedGridView(
                      position: index,
                      verticalOffset: 50.0,
                      child: OrderCard(
                        branchName: order.branchName,
                        orderDate: order.createdAt,
                        orderStatus: order.status,
                        orderItems: order.items,
                        orderPrice: order.totalPrice,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
      }
    },
  );
}
