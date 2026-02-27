import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/base_card.dart/base_card.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

enum BranchStatus { open, closed }

class BranchCard extends StatelessWidget {
  final String name;
  final String address;
  final String distance;
  final String workingHours;
  final bool isOpen;
  final VoidCallback onTap;

  const BranchCard({
    super.key,
    required this.name,
    required this.address,
    required this.distance,
    required this.workingHours,
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isOpen) {
          //Closed Res
          return;
        }
        onTap();
      },
      child: BaseCard(
        child: Padding(
          padding: AppSpacing.md.all,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _LocationIcon(),
              Gaps.w16,
              Expanded(
                child: _BranchInfo(
                  name: name,
                  address: address,
                  distance: distance,
                  workingHours: workingHours,
                ),
              ),
              _BranchTrailing(isOpen: isOpen),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationIcon extends StatelessWidget {
  const _LocationIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.sm.all,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Icon(
        CupertinoIcons.placemark,
        color: AppColors.primary,
      ),
    );
  }
}

class _BranchInfo extends StatelessWidget {
  final String name;
  final String address;
  final String distance;
  final String workingHours;

  const _BranchInfo({
    required this.name,
    required this.address,
    required this.distance,
    required this.workingHours,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          name,
          contentStyle: ContentStyle.bodyLarge,
          fontWeight: FontWeight.w600,
        ),
        Gaps.h4,
        AppText(
          address,
          contentStyle: ContentStyle.labelLarge,
          contentColor: AppColors.textSecondary,
        ),
        // Gaps.h8,
        // _InfoItem(
        //   icon: CupertinoIcons.placemark,
        //   text: distance,
        // ),
        //Gaps.h2,

        Gaps.h8,
        _InfoItem(
          icon: CupertinoIcons.time,
          text: workingHours,
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.textSecondary,
        ),
        Gaps.w2,
        Expanded(
          child: AppText(
            text,
            contentStyle: ContentStyle.labelLarge,
            contentColor: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _BranchTrailing extends StatelessWidget {
  final bool isOpen;

  const _BranchTrailing({required this.isOpen});

  @override
  Widget build(BuildContext context) {
    final color = isOpen ? AppColors.success : AppColors.error;

    final title = isOpen ? "Open" : "Closed";

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.xs,
            horizontal: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: AppText(
            title,
            contentStyle: ContentStyle.labelMedium,
            contentColor: color,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gaps.w8,
        Visibility(
          visible: isOpen,
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
