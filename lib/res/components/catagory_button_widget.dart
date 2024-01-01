import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryButtonWidget extends StatefulWidget {
  CategoryButtonWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  final String? text;
  bool isSelected;
  final VoidCallback onPressed;

  @override
  State<CategoryButtonWidget> createState() => _CatagoryButtonWidgetState();
}

class _CatagoryButtonWidgetState extends State<CategoryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10,
      ),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            color: widget.isSelected
                ? const Color(0xff354633)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              widget.text.toString(),
              style: themeProvider.currentTheme == AppTheme.lightTheme
                  ? TextStyle(
                      color: widget.isSelected ? Colors.white : Colors.black,
                      fontSize: 16,
                    )
                  : const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
