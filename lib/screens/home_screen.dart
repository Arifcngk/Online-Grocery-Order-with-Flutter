import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:manav_sepeti/services/utils.dart';
import 'package:manav_sepeti/widgets/card_items.dart';
import 'package:manav_sepeti/widgets/on_sale_widget.dart';
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
  final List<Map<String, dynamic>> saleProduct = [
    {
      'productName': 'Şeftali',
      'oldPrice': '10.00 TL',
      'newPrice': '7,99 TL',
      'imagePath': 'images/onsale1.jpg',
    },
    {
      'productName': 'Elma',
      'oldPrice': '13.00 TL',
      'newPrice': '9,99 TL',
      'imagePath': 'images/kırmızı_elma.jpg',
    },
    {
      'productName': 'Yesil Elma',
      'oldPrice': '18.00 TL',
      'newPrice': '15,99 TL',
      'imagePath': 'images/yesil_elma.jpg',
    },
    {
      'productName': 'Yesil Elma',
      'oldPrice': '18.00 TL',
      'newPrice': '15,99 TL',
      'imagePath': 'images/yesil_elma.jpg',
    },
    {
      'productName': 'Yesil Elma',
      'oldPrice': '18.00 TL',
      'newPrice': '15,99 TL',
      'imagePath': 'images/yesil_elma.jpg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextButton(
                      onPressed: () {},
                      child: Text('İndirimli Tüm Ürünler',
                          style: TextStyle(
                              color:
                                  themeState ? Colors.white : Colors.black))),
                ),
              ],
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.orangeAccent,
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'İndirimleri Yakala'.toUpperCase(),
                          style: TextStyle(
                              color: themeState
                                  ? const Color.fromARGB(255, 202, 47, 47)
                                  : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.25,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OnSaleWidget(
                          productName: saleProduct[index]['productName'],
                          oldPrice: saleProduct[index]['oldPrice'],
                          newPrice: saleProduct[index]['newPrice'],
                          imagePath: saleProduct[index]['imagePath'],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fırsatları Keşfet',
                    style: TextStyle(
                        color: themeState ? Colors.white : Colors.black),
                  ),
                  Text(
                    'Tüm Ürünler',
                    style: TextStyle(
                        color: themeState ? Colors.orangeAccent : Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: size.width / (size.height / 2),
              children: List.generate(4, (index) {
                return const ProductCardWidget(
                  productName: 'Elma',
                  status: 'Yeni Ürün',
                  newPrice: '7,99 TL',
                  imagePath: 'images/onsale1.jpg',
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
