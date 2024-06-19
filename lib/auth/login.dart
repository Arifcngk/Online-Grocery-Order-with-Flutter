import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:manav_sepeti/auth/forget_pass.dart';
import 'package:manav_sepeti/auth/register.dart';
import 'package:manav_sepeti/const/consts.dart';
import 'package:manav_sepeti/widgets/auth_button.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obscuretext = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
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
                    "Lütfen Bilgilerinizi Giriniz",
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passFocusNode),
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            focusNode: _passFocusNode,
                            controller: _passwordController,
                            obscureText: _obscuretext,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            onEditingComplete: _submitFormOnLogin,
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
                                    _obscuretext = !_obscuretext;
                                  });
                                },
                                child: Icon(
                                  _obscuretext
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(ForgetPassword.routeName);
                            },
                            child: const Text(
                              maxLines: 1,
                              'Şifremi Unuttum',
                              style: TextStyle(
                                  color: Colors.orange,
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        AuthButton(
                          function: () {},
                          text: 'Giriş Yap',
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 20),
                        SocialLoginButton(
                          height: 50,
                          text: 'Google ile Giriş Yap',
                          buttonType: SocialLoginButtonType.google,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 30),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'veya',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Expanded(child: Divider(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SocialLoginButton(
                          height: 50,
                          text: 'Ziyaretçi Olarak Devam Et',
                          backgroundColor: Colors.grey[700]!,
                          buttonType: SocialLoginButtonType.generalLogin,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Hesabınız yok mu?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(Register.routeName);
                              },
                              child: const Text(
                                'Kayıt Ol',
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
