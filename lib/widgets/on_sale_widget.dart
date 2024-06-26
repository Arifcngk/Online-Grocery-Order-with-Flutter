import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:manav_sepeti/services/utils.dart';

class OnSaleWidget extends StatefulWidget {
  final String productName;
  final String oldPrice;
  final String newPrice;
  final String imagePath;

  const OnSaleWidget({
    super.key,
    required this.productName,
    required this.oldPrice,
    required this.newPrice,
    required this.imagePath,
  });

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    final theme = utils.getTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            height: size.height * 0.3,
            width: size.width * 0.4,
            decoration: BoxDecoration(
              color: theme ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Divider(
                  color: theme ? Colors.white : Colors.orangeAccent,
                  height: 1,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.productName,
                                  style: TextStyle(
                                    color: theme ? Colors.white : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Ürün detay sayfasına gitme işlemi
                                    },
                                    child: Icon(
                                      IconlyLight.bag2,
                                      color:
                                          theme ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      // Ürün detay sayfasına gitme işlemi
                                    },
                                    child: Icon(
                                      IconlyLight.heart,
                                      color:
                                          theme ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.oldPrice,
                                style: TextStyle(
                                  color: theme ? Colors.white : Colors.black,
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.newPrice,
                                style: TextStyle(
                                  color: theme ? Colors.white : Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
