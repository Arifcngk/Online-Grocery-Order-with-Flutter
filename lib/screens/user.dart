import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
import 'package:manav_sepeti/services/global_method.dart';
import 'package:manav_sepeti/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _adressController =
        TextEditingController(text: '');
    final themeState = Provider.of<DarkThemeProvider>(context);
    void dispose() {
      _adressController.dispose();
      super.dispose();
    }

    GlobalMethods globalMethods = GlobalMethods();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SwitchListTile(
              title: const TextWidget(
                  darkThemeText: 'Karanlık Mod',
                  lightThemeText: 'Aydınlık Mod'),
              secondary: Icon(
                themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                color: Colors.orangeAccent,
              ),
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.getDarkTheme,
              activeColor: Colors.orangeAccent,
              activeTrackColor: Colors.orange,
            ),
            const SizedBox(height: 20),
            _listTile(
              title: 'Adreslerim',
              icon: IconlyLight.profile,
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return SafeArea(
                      child: AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Kaydet'),
                          ),
                        ],
                        title: const Text('Adreslerim'),
                        content: TextField(
                            onChanged: (value) {
                              //  _adressController.text = value;
                            },
                            controller: _adressController,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              hintText: 'Adresinizi giriniz',
                              border: OutlineInputBorder(),
                            )),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            _listTile(
              title: 'Siparişlerim',
              icon: IconlyLight.bag,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            _listTile(
              title: 'Favorilerim',
              icon: IconlyLight.heart,
              onPressed: () {
                Navigator.pushNamed(context, '/wishlist_screen');
              },
            ),
            const SizedBox(height: 10),
            _listTile(
              title: 'Son Görüntülenenler',
              icon: IconlyLight.show,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            _listTile(
              title: 'Parolamı Değiştir',
              icon: IconlyLight.unlock,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            _listTile(
              title: 'Çıkış Yap',
              icon: IconlyLight.logout,
              onPressed: () {
                globalMethods.showCustomAlertDialog(
                    ctx: context,
                    title: 'Çıkış Yap',
                    content: 'Çıkış yapmak istediğinizden emin misiniz ?',
                    buttonText: 'Evet',
                    icon: IconlyBold.logout,
                    iconColor: Colors.orange);
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile _listTile(
      {String? title,
      String? subtitle,
      required IconData icon,
      required Function onPressed}) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          title ?? 'Yükleniyor',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: themeState.getDarkTheme ? Colors.white : Colors.black),
        ),
      ),
      subtitle: Text(
        subtitle ?? '',
        style: const TextStyle(fontSize: 14),
      ),
      leading: Icon(
        icon,
        size: 30,
        color: Colors.orangeAccent,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () => onPressed(),
    );
  }
}
