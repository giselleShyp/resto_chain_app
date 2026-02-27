import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/base_card.dart/base_card.dart';
import 'package:resto_chain_app/core/widgets/divider/app_divider.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

enum OrderStatus {
  delivered,
  preparing,
  onTheWay,
  cancelled,
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.branchName,
    required this.orderDate,
    required this.orderStatus,
    required this.orderPrice,
  });

  final String branchName;
  final DateTime orderDate;
  final OrderStatus orderStatus;
  final double orderPrice;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
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
            _buildOrdersList(),
            Gaps.h8,
            _buildOrderPrice(),
          ],
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
  String title = "Delivered";

  switch (orderStatus) {
    case OrderStatus.delivered:
      color = AppColors.accent;
      title = "Delivered";
      break;
    case OrderStatus.onTheWay:
      color = Colors.blue;
      title = "On the Way";
      break;
    case OrderStatus.preparing:
      color = AppColors.secondary;
      title = "Preparing";
      break;
    case OrderStatus.cancelled:
      color = AppColors.error;
      title = "Cancelled";
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
            orderDate.toIso8601String(),
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
          title, //Status
          contentStyle: ContentStyle.labelMedium,
          contentColor: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget _buildOrdersList() {
  return Row(
    children: [
      AppText(
        "count x ", //2x
        contentStyle: ContentStyle.labelMedium,
        contentColor: AppColors.textSecondary,
        fontWeight: FontWeight.w500,
      ),
      AppText(
        "food name", // 2x Dragon Roll
        contentStyle: ContentStyle.labelMedium,
        contentColor: AppColors.textSecondary,
        fontWeight: FontWeight.w500,
      ),
    ],
  );
}

Widget _buildOrderPrice() {
  return Row(
    children: [
      AppText(
        "Total: Price ",
        contentStyle: ContentStyle.bodyLarge,
        fontWeight: FontWeight.w600,
      ),
      Spacer(),
      Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.xs,
          horizontal: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.s),
        ),
        child: AppText(
          "Recorder", //Status
          contentStyle: ContentStyle.labelMedium,
          contentColor: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
