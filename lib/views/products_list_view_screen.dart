import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/utils/products_json.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsListViewScreen extends StatelessWidget {
  const ProductsListViewScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    List<ProductModel> categoryProducts = Products.productsList
        .where((jsonItem) => jsonItem['category'] == category)
        .map((jsonItem) => ProductModel.fromJson(jsonItem))
        .toList();

    List<ProductModel> allProducts = Products.productsList
        .map((jsonItem) => ProductModel.fromJson(jsonItem))
        .toList();

    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(
              color: themeProvider.currentTheme==AppTheme.lightTheme?Colors.black:Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: themeProvider.currentTheme==AppTheme.lightTheme?Colors.black:Colors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: ListView.builder(
          itemCount:
              category == 'all' ? allProducts.length : categoryProducts.length,
          itemBuilder: (context, index) {
            ProductModel product = ProductModel.fromJson(
              Products.productsList[index],
            );
            if (category == 'all') {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        product: ProductModel(
                          id: allProducts[index].id.toString(),
                          name: allProducts[index].name.toString(),
                          price: allProducts[index].price,
                          description: allProducts[index].description.toString(),
                          image: allProducts[index].image.toString(),
                        ),
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Image.network(allProducts[index].image.toString()),
                    title: Text(allProducts[index].name.toString()),
                    subtitle: Text(allProducts[index].price.toString()),
                  ),
                ),
              );
            } else if (product.category?.toLowerCase() == category) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        product: ProductModel(
                          id: categoryProducts[index].id.toString(),
                          name: categoryProducts[index].name.toString(),
                          price: categoryProducts[index].price,
                          description: categoryProducts[index].description.toString(),
                          image: categoryProducts[index].image.toString(),
                        ),
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    leading:
                        Image.network(categoryProducts[index].image.toString()),
                    title: Text(categoryProducts[index].name.toString()),
                    subtitle: Text(categoryProducts[index].price.toString()),
                  ),
                ),
              );
            }
          }),
    ));
  }
}
