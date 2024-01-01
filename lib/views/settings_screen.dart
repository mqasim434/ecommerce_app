import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(
                color: themeProvider.currentTheme==AppTheme.lightTheme?Colors.black:Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 80,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  width: 200,
                  themeProvider.currentTheme == AppTheme.lightTheme
                      ? 'assets/icons/light_mode_icon.png'
                      : 'assets/icons/dark_mode_icon.png'),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 50,
                ),
                child: Text(
                  themeProvider.currentTheme == AppTheme.lightTheme
                      ? 'Light Mode'
                      : 'Dark Mode',
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              Stack(
                alignment: themeProvider.currentTheme == AppTheme.darkTheme
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: themeProvider.currentTheme == AppTheme.darkTheme
                          ? Colors.blueAccent
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: InkWell(
                      onTap: () {
                        themeProvider.toggleTheme();
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
