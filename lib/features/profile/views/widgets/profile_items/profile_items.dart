import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/styles/radius/app_radius.dart';
import 'package:resto_chain_app/core/styles/spaces/app_spacing.dart';
import 'package:resto_chain_app/core/styles/theme/app_colors.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({
    super.key,
    required this.onEditProfileTap,
    required this.onSavedAddressTap,
    required this.onFavoriteTap,
    required this.onOrderHistoryTap,
  });

  final VoidCallback onEditProfileTap;
  final VoidCallback onSavedAddressTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onOrderHistoryTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        side: BorderSide(
          color: Colors.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onEditProfileTap,
            child: itemRow(
              icon: CupertinoIcons.person,
              title: 'Edit Profile',
            ),
          ),
          Divider(
            height: 0.0,
            color: Colors.grey.withValues(alpha: 0.2),
          ),
          InkWell(
            onTap: onSavedAddressTap,
            child: itemRow(
              icon: CupertinoIcons.placemark,
              title: 'Saved Address',
            ),
          ),
          Divider(
            height: 0.0,
            color: Colors.grey.withValues(alpha: 0.2),
          ),
          InkWell(
            onTap: onFavoriteTap,
            child: itemRow(
              icon: CupertinoIcons.star,
              title: 'Favorite',
            ),
          ),
          Divider(
            height: 0.0,
            color: Colors.grey.withValues(alpha: 0.2),
          ),
          InkWell(
            onTap: onOrderHistoryTap,
            child: itemRow(
              icon: CupertinoIcons.square_favorites,
              title: 'Order History',
            ),
          ),
        ],
      ),
    );
  }
}

Widget itemRow({
  required IconData icon,
  required String title,
}) {
  return Padding(
    padding: AppSpacing.md.all,
    child: Row(
      children: [
        Icon(
          icon,
          color: AppColors.textSecondary,
        ),
        Gaps.w12,
        AppText(
          title,
          fontWeight: FontWeight.w500,
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: AppColors.textSecondary,
        )
      ],
    ),
  );
}
