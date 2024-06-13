import 'package:flutter/material.dart';
import 'package:manav_sepeti/screens/wishlist/wishlist_widget.dart';
import 'package:manav_sepeti/services/global_method.dart';
import 'package:manav_sepeti/services/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorilerim',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: 6, // Bu değeri istediğiniz öğe sayısına göre ayarlayın
        itemBuilder: (context, index) {
          return const WishlistWidget();
        },
      ),
    );
  }
}
