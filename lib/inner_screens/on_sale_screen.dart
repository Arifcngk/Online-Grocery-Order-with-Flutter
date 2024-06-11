import 'package:flutter/material.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
import 'package:manav_sepeti/services/utils.dart';
import 'package:manav_sepeti/widgets/on_sale_widget.dart';
import 'package:provider/provider.dart';

class OnSaleScreen extends StatefulWidget {
  const OnSaleScreen({super.key});
  static const routeName = '/OnSaleScreen';

  @override
  State<OnSaleScreen> createState() => _OnSaleScreenState();
}

class _OnSaleScreenState extends State<OnSaleScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    bool _isEmpty = true;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Center(
            child: Image.asset(
              'images/navbar_logo.png',
            ),
          ),
        ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: size.width / (size.height / 1.8),
          children: List.generate(6, (index) {
            return const OnSaleWidget(
              productName: 'Elma',
              oldPrice: '10.00 TL',
              newPrice: '7,99 TL',
              imagePath: 'images/onsale1.jpg',
            );
          }),
        ),
      ),
    );
  }
}
