import 'package:flutter/material.dart';
import 'package:manav_sepeti/screens/cart/cart_widget.dart';
import 'package:manav_sepeti/services/global_method.dart';
import 'package:manav_sepeti/services/utils.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist_screen';

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    final theme = utils.getTheme;
    GlobalMethods globalMethods = GlobalMethods();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
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
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return CartWidget();
        },
      ),
    );
  }
}
