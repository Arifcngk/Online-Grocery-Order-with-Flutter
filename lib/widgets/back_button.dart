import 'package:flutter/material.dart';
import 'package:manav_sepeti/services/utils.dart';

class BackButoon extends StatelessWidget {
  const BackButoon({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
