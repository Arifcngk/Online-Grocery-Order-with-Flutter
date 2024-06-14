import 'package:flutter/material.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class TextWidget extends StatelessWidget {
  final String darkThemeText;
  final String lightThemeText;

  const TextWidget({
    super.key,
    required this.darkThemeText,
    required this.lightThemeText,
  });

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Text(
      themeState.getDarkTheme ? darkThemeText : lightThemeText,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: themeState.getDarkTheme ? Colors.white : Colors.black),
    );
  }
}
