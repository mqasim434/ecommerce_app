import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/res/components/collection_widget.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/views/products_list_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Shop',
            style: TextStyle(
              color: themeProvider.currentTheme==AppTheme.lightTheme?Colors.black:Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 80,
        ),
        body: Center(
          child: Column(
            children: [
              CollectionWidget(
                image:
                    'https://images.pexels.com/photos/6626999/pexels-photo-6626999.jpeg?auto=compress&cs=tinysrgb&w=600',
                label: 'Men',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductsListViewScreen(
                        category: 'men',
                      ),
                    ),
                  );
                },
              ),
              CollectionWidget(
                image:
                    'https://images.pexels.com/photos/9834882/pexels-photo-9834882.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                label: 'Women',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductsListViewScreen(
                        category: 'women',
                      ),
                    ),
                  );
                },
              ),
              CollectionWidget(
                image:
                    'https://images.pexels.com/photos/1564828/pexels-photo-1564828.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                label: 'Kids',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductsListViewScreen(
                        category: 'kids',
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductsListViewScreen(
                          category: 'all',
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff354633)),
                  ),
                  child: const Text('Shop All'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
