import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/providers/size_provider.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/res/components/size_button_widget.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Details',
            style: TextStyle(fontSize: 24, color: themeProvider.currentTheme==AppTheme.lightTheme?Colors.black:Colors.white,),
          ),
          iconTheme: IconThemeData(color: themeProvider.currentTheme==AppTheme.lightTheme?Colors.black:Colors.white),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          product.image.toString(),
                        ),
                      )),
                ),
              ),
              Text(
                product.name.toString(),
                style: TextStyle(
                  color: themeProvider.currentTheme==AppTheme.lightTheme?Colors.black:Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                product.price.toString(),
                style: TextStyle(
                  color: themeProvider.currentTheme==AppTheme.lightTheme?Colors.black:Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Text(
                  product.description.toString(),
                  textAlign: TextAlign.justify,
                ),
              ),
              ChangeNotifierProvider(
                create: (_) => SizeProvider(),
                child: Consumer<SizeProvider>(
                  builder: (context, provider, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizeButtonWidget(
                          text: 'S',
                          isSelected: provider.selectedSize == 'S',
                          onPressed: () {
                            provider.changeSize('S');
                          },
                        ),
                        SizeButtonWidget(
                          text: 'M',
                          isSelected: provider.selectedSize == 'M',
                          onPressed: () {
                            provider.changeSize('M');
                          },
                        ),
                        SizeButtonWidget(
                          text: 'L',
                          isSelected: provider.selectedSize == 'L',
                          onPressed: () {
                            provider.changeSize('L');
                          },
                        ),
                        SizeButtonWidget(
                          text: 'XL',
                          isSelected: provider.selectedSize == 'XL',
                          onPressed: () {
                            provider.changeSize('XL');
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xff354633),
                ),
                child: const Center(child: Text('Buy Now',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
