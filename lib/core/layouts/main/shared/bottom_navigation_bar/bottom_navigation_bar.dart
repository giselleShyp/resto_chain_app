import 'package:flutter/material.dart';
import 'package:resto_chain_app/core/layouts/main/shared/bottom_nav_item.dart';
import 'package:resto_chain_app/core/widgets/text/app_text.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavItem> items;

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            border: Border(
              top: BorderSide(
                color: Colors.grey.withValues(alpha: 0.3),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              widget.items.length,
              (index) => Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    if (widget.currentIndex != index) {
                      widget.onTap(index);
                    }
                  },
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: BottomNavBarIcon(
                              icon: widget.items[index].icon,
                              index: index,
                              currentIndex: widget.currentIndex,
                            ),
                          ),
                          BottomNavBarLabel(
                            label: widget.items[index].label,
                            index: index,
                            currentIndex: widget.currentIndex,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({
    super.key,
    required this.icon,
    required this.index,
    required this.currentIndex,
  });

  final IconData icon;
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: index == currentIndex ? 1.0 : 1.0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.elasticOut,
      child: Icon(
        icon,
        color: index == currentIndex
            ? Theme.of(context).colorScheme.primary
            : Colors.grey,
      ),
    );
  }
}

class BottomNavBarLabel extends StatelessWidget {
  const BottomNavBarLabel({
    super.key,
    required this.label,
    required this.index,
    required this.currentIndex,
  });
  final String label;
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: index == currentIndex ? 1.0 : 1.0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.elasticOut,
      child: AppText(
        label,
        contentStyle: ContentStyle.labelSmall,
        fontWeight: FontWeight.w600,
        contentColor: index == currentIndex
            ? Theme.of(context).colorScheme.primary
            : Colors.grey,
      ),
    );
  }
}
