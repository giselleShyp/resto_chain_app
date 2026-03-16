import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/enums/view_state.dart';
import 'package:resto_chain_app/core/layouts/main/main_layout.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/orders/controllers/orders_controller.dart';
import 'package:resto_chain_app/features/orders/views/widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final ordersController = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      header: _buildHeader(),
      body: _buildBody(ordersController: ordersController),
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

Widget _buildBody({required OrdersController ordersController}) {
  return Obx(() {
    switch (ordersController.state.value) {
      case ViewState.loading:
        return CircularProgressIndicator();

      case ViewState.error:
        return AppText(
          ordersController.errorMessage.value ?? "Something went wrong",
        );

      case ViewState.empty:
        return AppText("You Don't have orders");
      case ViewState.success:
        return Expanded(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: RefreshIndicator(
              onRefresh: () => ordersController.refresh(),
              child: ListView.builder(
                itemCount: ordersController.orders.length,
                itemBuilder: (context, index) {
                  final order = ordersController.orders[index];
                  return OrderCard(
                    branchName: order.branchName,
                    orderDate: order.createdAt,
                    orderStatus: order.status,
                    orderItems: order.items,
                    orderPrice: order.totalPrice,
                  );
                },
              ),
            ),
          ),
        );
    }
  });
}


  // Padding(
  //   padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
  //   child: Column(
  //     children: [
  //       OrderCard(
  //         branchName: "Burger",
  //         orderDate: DateTime.now(),
  //         orderStatus: OrderStatus.delivered,
  //         orderPrice: 13.0,
  //       ),
  //     ],
  //   ),
  // );
