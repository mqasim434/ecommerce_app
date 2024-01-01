import 'package:ecommerce_app/providers/navigation_provider.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavbarItemWidget extends StatelessWidget {
  const NavbarItemWidget({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () {
            provider.changeScreen(index, context);
            controller.animateToPage(index,
                duration: const Duration(microseconds: 500),
                curve: Curves.easeInOut);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: provider.currentIndex == index
                    ? themeProvider.currentTheme == AppTheme.lightTheme
                    ? const Color(0xff354633)
                    : Colors.white
                    : Colors.grey,
              ),
              Text(
                label,
              ),
            ],
          ),
        );
      },
    );
  }
}
