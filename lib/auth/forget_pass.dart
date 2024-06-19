import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:manav_sepeti/const/consts.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
import 'package:manav_sepeti/services/utils.dart';
import 'package:manav_sepeti/widgets/auth_button.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  static const routeName = '/ForgetPassword';
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  void _forgetPassword() async {}

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            autoplay: true,
            duration: 500,
            autoplayDelay: 6000,
            itemCount: Contss.authImagesPath.length,
            itemBuilder: (context, index) {
              return Image.asset(
                Contss.authImagesPath[index],
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              );
            },
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.06,
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
                const Text(
                  'Şifremi Unuttum',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'E-posta',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                AuthButton(
                    function: () {},
                    text: 'Parolamı Sıfırla',
                    color: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
