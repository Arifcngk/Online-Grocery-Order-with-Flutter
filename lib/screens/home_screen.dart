import 'package:flutter/material.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
import 'package:manav_sepeti/services/utils.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _slider = [
    'images/slider1.jpg',
    'images/slider2.jpg',
    'images/slider3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    return Scaffold(
      body: SizedBox(
        height: size.height * 0.3,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              _slider[index],
              fit: BoxFit.cover,
            );
          },
          itemCount: _slider.length,
          pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              activeColor: Colors.orange,
            ),
            alignment: Alignment.bottomCenter,
          ),
          autoplay: true,
          // control: const SwiperControl(color: Colors.orangeAccent),
        ),
      ),
    );
  }
}
