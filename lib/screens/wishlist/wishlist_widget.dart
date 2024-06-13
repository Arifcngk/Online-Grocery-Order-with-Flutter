import 'package:flutter/material.dart';
import 'package:manav_sepeti/services/global_method.dart';
import 'package:manav_sepeti/services/utils.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    final theme = utils.getTheme;
    GlobalMethods globalMethods = GlobalMethods();
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product_detail_screen');
      },
      child: Container(
        height: size.height * 0.15,
      ),
    );
  }
}
