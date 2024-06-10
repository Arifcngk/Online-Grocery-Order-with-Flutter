import 'package:flutter/material.dart';
import 'package:manav_sepeti/widgets/categories_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Map<String, dynamic>> catInfo = [
    {
      'catText': 'Sebze',
      'color': Colors.green,
      'imgPath': 'images/vegetables.png',
    },
    {
      'catText': 'Meyve',
      'color': Colors.orange,
      'imgPath': 'images/fruits.png',
    },
    {
      'catText': 'Kırmızı Et',
      'color': Colors.red,
      'imgPath': 'images/meat_red.png',
    },
    {
      'catText': 'Beyaz Et',
      'color': Colors.yellow,
      'imgPath': 'images/chickeen.png',
    },
    {
      'catText': 'Süt ve Süt Ürünleri',
      'color': Colors.blue,
      'imgPath': 'images/milk.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 10,
        right: 10,
      ),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 230,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(
          catInfo.length,
          (index) => CategoriesWidget(
            color: catInfo[index]['color'],
            catText: catInfo[index]['catText'],
            imgPath: catInfo[index]['imgPath'],
          ),
        ),
      ),
    ));
  }
}
