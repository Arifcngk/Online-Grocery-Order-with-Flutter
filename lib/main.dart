import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manav_sepeti/auth/forget_pass.dart';
import 'package:manav_sepeti/auth/login.dart';
import 'package:manav_sepeti/auth/register.dart';
import 'package:manav_sepeti/const/theme_data.dart';
import 'package:manav_sepeti/inner_screens/on_sale_screen.dart';
import 'package:manav_sepeti/inner_screens/product_details.dart';
import 'package:manav_sepeti/inner_screens/product_screen.dart';
import 'package:manav_sepeti/orders/orders_screen.dart';
import 'package:manav_sepeti/provider/dark_theme_provider.dart';
import 'package:manav_sepeti/screens/btm_bar.dart';
import 'package:manav_sepeti/screens/home_screen.dart';
import 'package:manav_sepeti/screens/wishlist/wishlist_screen.dart';
import 'package:manav_sepeti/services/dark_theme_pref.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkThemePref.getDarkTheme().then((value) {
      themeChangeProvider.setDarkTheme = value;
    });
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: LoginScreen(),
          routes: {
            OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            ProductScreen.routeName: (ctx) => const ProductScreen(),
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
            WishlistScreen.routeName: (ctx) => const WishlistScreen(),
            OrdersScreen.routeName: (ctx) => const OrdersScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            Register.routeName: (ctx) => Register(),
            ForgetPassword.routeName: (ctx) => const ForgetPassword(),
            BottomBarScreen.routeName: (ctx) => const BottomBarScreen(),
          },
        );
      }),
    );
  }
}
