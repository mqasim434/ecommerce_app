import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.hasOutline = false,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool hasOutline;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: themeProvider.currentTheme == AppTheme.lightTheme
              ? Colors.white
              : const Color(0xff5e5e5e),
          borderRadius: BorderRadius.circular(
            50,
          ),
          border: Border.all(
            color: hasOutline ? Colors.black45 : Colors.transparent,
          ),
        ),
        child: Icon(
          icon,
          color: themeProvider.currentTheme == AppTheme.lightTheme
              ? Colors.black
              : Colors.white,
        ),
      ),
    );
  }
}
