import 'package:ecommerce_app/providers/category_provider.dart';
import 'package:ecommerce_app/providers/navigation_provider.dart';
import 'package:ecommerce_app/providers/size_provider.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/views/home.dart';
import 'package:ecommerce_app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SizeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context,provider,_){
          return MaterialApp(
            theme: provider.currentTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      )
    );
  }
}
