import 'package:flutter/material.dart';
import 'package:manav_sepeti/widgets/text_widget.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget(
      {super.key,
      required this.color,
      required this.catText,
      required this.imgPath});
  String catText, imgPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print('Kategoriye tıklandı');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.5),
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: _screenWidth * 0.3,
              height: _screenWidth * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            TextWidget(darkThemeText: catText, lightThemeText: catText)
          ],
        ),
      ),
    );
  }
}
