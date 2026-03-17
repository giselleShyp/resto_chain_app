import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/base_card.dart/base_card.dart';
import 'package:resto_chain_app/core/widgets/divider/app_divider.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';
import 'package:resto_chain_app/features/orders/data/enums/order_status_enum.dart';
import 'package:resto_chain_app/features/orders/data/models/order_item_model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.branchName,
    required this.orderDate,
    required this.orderStatus,
    required this.orderItems,
    required this.orderPrice,
  });

  final String branchName;
  final DateTime orderDate;
  final OrderStatus orderStatus;
  final List<OrderItemModel> orderItems;
  final double orderPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.sm),
      child: BaseCard(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.md,
            horizontal: AppRadius.md,
          ),
          child: Column(
            children: [
              _buildOrderTitle(
                branchName: branchName,
                orderStatus: orderStatus,
                orderDate: orderDate,
              ),
              Gaps.h12,
              AppDivider(),
              Gaps.h12,
              _buildOrdersList(items: orderItems),
              Gaps.h8,
              _buildOrderPrice(orderPrice: orderPrice),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildOrderTitle({
  required String branchName,
  required DateTime orderDate,
  required OrderStatus orderStatus,
}) {
  Color color = AppColors.accent;
  String status = "Delivered";

  switch (orderStatus) {
    case OrderStatus.delivered:
      color = AppColors.accent;
      status = "Delivered";
      break;
    case OrderStatus.onTheWay:
      color = Colors.blue;
      status = "On the Way";
      break;
    case OrderStatus.preparing:
      color = AppColors.secondary;
      status = "Preparing";
      break;
    case OrderStatus.cancelled:
      color = AppColors.error;
      status = "Cancelled";
      break;
  }

  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            branchName,
            contentStyle: ContentStyle.bodyLarge,
            fontWeight: FontWeight.w600,
          ),
          AppText(
            DateFormat('MMM d, yyyy').format(orderDate),
            contentStyle: ContentStyle.labelMedium,
            contentColor: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      Spacer(),
      Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.xs,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: color.withValues(alpha: 0.5),
          ),
        ),
        child: AppText(
          status, //Status
          contentStyle: ContentStyle.labelMedium,
          contentColor: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget _buildOrdersList({required List<OrderItemModel> items}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: items.map((item) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          children: [
            AppText(
              "${item.quantity}x ",
              contentStyle: ContentStyle.labelMedium,
              contentColor: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            Expanded(
              child: AppText(
                item.name,
                contentStyle: ContentStyle.labelMedium,
                contentColor: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}

Widget _buildOrderPrice({required double orderPrice}) {
  return Row(
    children: [
      AppText(
        "\$${orderPrice.toStringAsFixed(2)}",
        contentStyle: ContentStyle.bodyLarge,
        fontWeight: FontWeight.w600,
      ),
      // Spacer(),
      // Container(
      //   padding: EdgeInsets.symmetric(
      //     vertical: AppSpacing.xs,
      //     horizontal: AppSpacing.sm,
      //   ),
      //   decoration: BoxDecoration(
      //     color: AppColors.primary.withValues(alpha: 0.1),
      //     borderRadius: BorderRadius.circular(AppRadius.s),
      //   ),
      //   child: AppText(
      //     "Recorder", //Status
      //     contentStyle: ContentStyle.labelMedium,
      //     contentColor: AppColors.primary,
      //     fontWeight: FontWeight.w500,
      //   ),
      // ),
    ],
  );
}
