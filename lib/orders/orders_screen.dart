import 'package:flutter/material.dart';
import 'package:manav_sepeti/orders/orders_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});
  static const String routeName = '/orders-screen';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Siparişlerim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return OrderWisgets();
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 1,
                color: Colors.grey,
              );
            },
            itemCount: 10),
      ),
    );
  }
}
