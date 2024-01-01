import 'package:ecommerce_app/res/components/navbar_item.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavbarItemWidget(
            label: 'Home',
            icon: Icons.home,
            index: 0,
            controller: controller,
          ),
          NavbarItemWidget(
            label: 'Shop',
            icon: Icons.shop,
            index: 1,
            controller: controller,
          ),
          NavbarItemWidget(
            label: 'Settings',
            icon: Icons.settings,
            index: 2,
            controller: controller,
          ),
        ],
      ),
    );
  }
}


