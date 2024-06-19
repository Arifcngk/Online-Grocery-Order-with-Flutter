import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:manav_sepeti/const/consts.dart';
import 'package:manav_sepeti/widgets/video_player_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _passFocusNode = FocusNode();
    final _formKey = GlobalKey<FormState>();
    final _obscuretext = true;

    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      _passFocusNode.dispose();
      super.dispose();
    }

    void _submitFormOnLiogin() {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (!isValid) {
        return;
      }
      _formKey.currentState!.save();
    }

    return Scaffold(
      body: Stack(
        children: [
          Swiper(
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
                    "Hoşgelidiniz",
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
                        // Password
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            // focusNode: _passFocusNode,
                            controller: _passwordController,
                            obscureText: _obscuretext,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            onEditingComplete: () {
                              _submitFormOnLiogin();
                            },
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
                                    _obscuretext != _obscuretext;
                                  });
                                },
                                child: const Icon(
                                  Icons.visibility,
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
