import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
import 'package:manav_sepeti/screens/card.dart';
import 'package:manav_sepeti/screens/categories.dart';
import 'package:manav_sepeti/screens/home_screen.dart';
import 'package:manav_sepeti/screens/user.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Anasayfa'},
    {'page': const CategoriesScreen(), 'title': 'Kategori'},
    {'page': const CardScreen(), 'title': 'Sepet'},
    {'page': const UserScreen(), 'title': 'Hesabım'}
  ];

  int _selectedIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color iconColor =
        themeState.getDarkTheme ? Colors.white : Colors.black;
    final Color selectedIconColor =
        themeState.getDarkTheme ? Colors.orange : Colors.orangeAccent;
    final Color appBarColor =
        themeState.getDarkTheme ? Colors.black : Colors.white;
    final Color appBarTextColor =
        themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Center(
            child: Image.asset(
              'assets/navbar_logo.png',
            ),
          ),
        ),
        backgroundColor: appBarColor,
        iconTheme: IconThemeData(color: appBarTextColor),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeState.getDarkTheme
            ? Theme.of(context).cardColor
            : Colors.white,
        showSelectedLabels: true,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        selectedItemColor: selectedIconColor,
        unselectedItemColor: iconColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
              color: _selectedIndex == 0 ? selectedIconColor : iconColor,
            ),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? IconlyBold.category : IconlyLight.category,
              color: _selectedIndex == 1 ? selectedIconColor : iconColor,
            ),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy,
              color: _selectedIndex == 2 ? selectedIconColor : iconColor,
            ),
            label: 'Sepet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2,
              color: _selectedIndex == 3 ? selectedIconColor : iconColor,
            ),
            label: 'Hesabım',
          ),
        ],
      ),
    );
  }
}
