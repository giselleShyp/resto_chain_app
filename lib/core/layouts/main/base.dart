import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_chain_app/core/controllers/bottom_nav_controller.dart';
import 'package:resto_chain_app/core/layouts/main/shared/bottom_nav_item.dart';
import 'package:resto_chain_app/core/layouts/main/shared/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:resto_chain_app/features/cart/views/cart_screen.dart';
import 'package:resto_chain_app/features/home/views/home_screen.dart';
import 'package:resto_chain_app/features/orders/views/orders_screen.dart';
import 'package:resto_chain_app/features/profile/views/profile_screen.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final BottomNavController navController = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomeScreen(),
    OrdersScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(251, 250, 249, 1),
          body: IndexedStack(
            index: navController.currentIndex.value,
            children: pages,
          ),
          bottomNavigationBar: MainBottomNavigationBar(
            currentIndex: navController.currentIndex.value,
            onTap: navController.changeIndex,
            items: [
              BottomNavItem(
                icon: Icons.home_outlined,
                label: "Home",
              ),
              BottomNavItem(
                icon: CupertinoIcons.square_favorites,
                label: "Orders",
              ),
              BottomNavItem(
                icon: CupertinoIcons.cart,
                label: "Cart",
              ),
              BottomNavItem(
                icon: CupertinoIcons.person,
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
