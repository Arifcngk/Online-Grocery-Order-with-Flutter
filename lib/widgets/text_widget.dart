import 'package:flutter/material.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
        final themeState = Provider.of<DarkThemeProvider>(context);

    return Text(
      themeState.getDarkTheme ? 'Koyu Tema' : 'Açık Tema',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
