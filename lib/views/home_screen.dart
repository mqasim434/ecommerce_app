import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/providers/category_provider.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/res/components/catagory_button_widget.dart';
import 'package:ecommerce_app/res/components/popular_item_widget.dart';
import 'package:ecommerce_app/res/components/product_hero_widget.dart';
import 'package:ecommerce_app/utils/products_json.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Home',
              style: TextStyle(
                  color: themeProvider.currentTheme==AppTheme.lightTheme?Colors.black:Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 80,
          ),
          body: ChangeNotifierProvider(
            create: (_) => CategoryProvider(),
            child: Consumer<CategoryProvider>(
              builder: (context, categoryProvider, child) {
                return Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryButtonWidget(
                            text: 'ALL',
                            isSelected:
                                categoryProvider.selectedCategory == 'ALL',
                            onPressed: () =>
                                categoryProvider.onCategoryPressed('ALL'),
                          ),
                          CategoryButtonWidget(
                            text: 'MEN',
                            isSelected:
                                categoryProvider.selectedCategory == 'MEN',
                            onPressed: () =>
                                categoryProvider.onCategoryPressed('MEN'),
                          ),
                          CategoryButtonWidget(
                            text: 'WOMEN',
                            isSelected:
                                categoryProvider.selectedCategory == 'WOMEN',
                            onPressed: () =>
                                categoryProvider.onCategoryPressed('WOMEN'),
                          ),
                          CategoryButtonWidget(
                            text: 'KIDS',
                            isSelected:
                                categoryProvider.selectedCategory == 'KIDS',
                            onPressed: () =>
                                categoryProvider.onCategoryPressed('KIDS'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Products.productsList.length,
                        itemBuilder: (context, index) {
                          ProductModel product = ProductModel.fromJson(
                            Products.productsList[index],
                          );
                          if (categoryProvider.selectedCategory == 'ALL') {
                            print(categoryProvider.selectedCategory);
                            return ProductHeroWidget(
                              product: product,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                      product: product,
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (product.category?.toLowerCase() ==
                              categoryProvider.selectedCategory.toLowerCase()) {
                            print(categoryProvider.selectedCategory);
                            return ProductHeroWidget(
                              product: product,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                      product: product,
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                          ),
                          child: Text(
                            'Popular Now',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Products.productsList.length,
                        itemBuilder: (context, index) {
                          ProductModel product = ProductModel.fromJson(
                              Products.productsList[index]);
                          return PopularItemWidget(
                            product: product,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    product: product,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          )),
    );
  }
}
