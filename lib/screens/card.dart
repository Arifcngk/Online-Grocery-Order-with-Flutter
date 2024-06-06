import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ListTile(
          title: Text(
            'Adreslerim',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Adreslerinizi buradan yönetebilirsiniz.',
            style: TextStyle(fontSize: 16),
          ),
          leading: Icon(IconlyLight.profile),
          trailing: Icon(IconlyLight.arrowRight2),
        ),
      ),
    );
  }
}
