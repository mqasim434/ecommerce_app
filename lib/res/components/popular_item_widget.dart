import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/res/components/rounded_icon_button.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularItemWidget extends StatelessWidget {
  const PopularItemWidget({
    super.key,
    required this.onPressed,
    required this.product,
  });

  final VoidCallback onPressed;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: screenWidth * 0.8,
          height: screenHeight * 0.15,
          decoration: BoxDecoration(
            color: themeProvider.currentTheme == AppTheme.lightTheme
                ? Colors.white
                : const Color(0xff5e5e5e),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(product.image.toString()),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    product.price.toString(),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: RoundedIconButton(
                    icon: Icons.shopping_bag_outlined,
                    hasOutline: true,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
