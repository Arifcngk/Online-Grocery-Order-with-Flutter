import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
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
              onPressed: () {},
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
                // return AwesomeDialog(
                //   context: context,
                //   animType: AnimType.rightSlide,
                //   dialogType: DialogType.info,
                //   body: const Center(
                //     child: Text('Çıkış yapmak istediğinizden emin misiz ?'),
                //   ),
                //   btnOkOnPress: () {},
                // ).show();
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
    return ListTile(
      title: Text(
        title ?? 'Yükleniyor',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
