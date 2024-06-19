import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:manav_sepeti/auth/login.dart';
import 'package:manav_sepeti/const/consts.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
import 'package:manav_sepeti/services/utils.dart';
import 'package:manav_sepeti/widgets/auth_button.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  static const routeName = '/register';
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // focus
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _adressFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  bool _obscureText = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _adressController.dispose();
    super.dispose();
  }

  void _submitFormOnRegister() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      // register user
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    Color color = Utils(context).color;
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            autoplay: true,
            duration: 500,
            autoplayDelay: 6000,
            itemBuilder: (context, index) => Image.asset(
              Contss.authImagesPath[index],
              fit: BoxFit.cover,
            ),
            itemCount: Contss.authImagesPath.length,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 120),
                  const Text(
                    "Hoşgeldiniz",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Lütfen Kayıt için Bilgilerinizi Giriniz",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // ad-soyad
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _nameController,
                            validator: (value) => value!.isEmpty
                                ? "Geçerli bir ad-soyad giriniz"
                                : null,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_nameFocusNode),
                            style: const TextStyle(color: Colors.orangeAccent),
                            decoration: const InputDecoration(
                              labelText: "Adınız-Soyadınız",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            ),
                          ),
                        ),
                        // eposta adresi
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_emailFocusNode),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains("@")) {
                                return "Geçerli bir email giriniz";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.orangeAccent),
                            decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            ),
                          ),
                        ),
                        // parola
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            focusNode: _passwordFocusNode,
                            controller: _passwordController,
                            obscureText: _obscureText,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            onEditingComplete: _submitFormOnRegister,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return "Geçerli bir parola giriniz";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.orangeAccent),
                            decoration: InputDecoration(
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                              labelText: "Parola",
                              labelStyle: const TextStyle(color: Colors.white),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _adressController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.streetAddress,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_adressFocusNode),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return "Geçerli bir adres giriniz";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.orangeAccent),
                            decoration: const InputDecoration(
                              labelText: "Adresiniz",
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        AuthButton(
                          function: () {},
                          text: 'Kayıt Ol',
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 20),

                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Hesabınız var mı?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: const Text(
                                'Giriş Yap ',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
