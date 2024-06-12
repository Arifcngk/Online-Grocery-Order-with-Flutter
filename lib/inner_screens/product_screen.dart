import 'package:flutter/material.dart';
import 'package:manav_sepeti/services/global_method.dart';
import 'package:manav_sepeti/services/utils.dart';
import 'package:manav_sepeti/widgets/card_items.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  static const routeName = '/ProductScreen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    bool _isEmpty = true;
    GlobalMethods globalMethods = GlobalMethods();
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchFocusNode,
                  onChanged: (value) {},
                  controller: _searchController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: themeState ? Colors.white : Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: themeState ? Colors.white : Colors.black,
                      ),
                    ),
                    hintText: 'Ürün Ara',
                    suffix: IconButton(
                      onPressed: () {
                        _searchController.clear();
                        _searchFocusNode.unfocus();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    hintStyle: TextStyle(
                      color: themeState ? Colors.white : Colors.black,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: size.width / (size.height / 1.8),
              children: List.generate(12, (index) {
                return const ProductCardWidget(
                  productName: 'Dolma Biber',
                  status: 'Yeni ',
                  newPrice: '7,99 TL',
                  imagePath: 'images/biber.jpg',
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
