import 'package:flutter/material.dart';

class OrderWisgets extends StatefulWidget {
  const OrderWisgets({super.key});

  @override
  State<OrderWisgets> createState() => _OrderWisgetsState();
}

class _OrderWisgetsState extends State<OrderWisgets> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: const Text('Toplam : 12 TL'),
      onTap: () {
        Navigator.of(context).pushNamed('/product-details-screen');
      },
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: const Text('Hamburger x2 Adet'),
      trailing: const Text('Teslim Edildi'),
    );
  }
}
