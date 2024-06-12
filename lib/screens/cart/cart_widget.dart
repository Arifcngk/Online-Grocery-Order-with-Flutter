import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:manav_sepeti/services/global_method.dart';
import 'package:manav_sepeti/services/utils.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final TextEditingController _quantityController =
      TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    _quantityController.text = '1';
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    final theme = utils.getTheme;
    GlobalMethods globalMethods = GlobalMethods();

    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: size.height * 0.12,
                width: size.width * 0.24,
                decoration: BoxDecoration(
                  color: theme ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  'images/kırmızı_elma.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'KIRMIZI ELMA',
                              style: TextStyle(
                                color: theme ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            '  15,99 ₺',
                            style: TextStyle(
                              color: theme ? Colors.white : Colors.black,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          _quantityControllerButton(
                            function: _decreaseQuantity,
                            iconColor: Colors.red,
                            icon: Icons.remove,
                          ),
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: TextField(
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: theme ? Colors.white : Colors.black,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty) {
                                    _quantityController.text = '1';
                                  } else {
                                    _quantity = int.parse(value);
                                  }
                                });
                              },
                            ),
                          ),
                          _quantityControllerButton(
                            function: _increaseQuantity,
                            iconColor: Colors.green,
                            icon: Icons.add,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  CupertinoIcons.cart_badge_minus,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              ),
                              const SizedBox(width: 5),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  IconlyLight.heart,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _quantity = 1;

  void _increaseQuantity() {
    setState(() {
      _quantity++;
      _quantityController.text = _quantity.toString();
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        _quantityController.text = _quantity.toString();
      }
    });
  }

  Widget _quantityControllerButton({
    required Function function,
    required Color iconColor,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Material(
        color: iconColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            function();
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
