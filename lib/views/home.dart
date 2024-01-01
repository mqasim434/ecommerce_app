import 'package:ecommerce_app/res/components/bottom_nav_bar.dart';
import 'package:ecommerce_app/views/ShopScreen.dart';
import 'package:ecommerce_app/views/home_screen.dart';
import 'package:ecommerce_app/views/settings_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            ShopScreen(),
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(controller: controller,),
      ),
    );
  }
}
