import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/colors.dart';
import 'package:sushi_app/home_page.dart';
import 'package:sushi_app/menu_page.dart';
import 'package:sushi_app/shopping_page.dart';
import 'package:sushi_app/tile_page.dart';
// import 'package:sushi_app/tail_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: primaryColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark),
  );
  runApp(const MyApp());
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.top]);
}

class MyApp extends StatelessWidget {\
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllData(),
      child: MaterialApp(
        // themeMode: ThemeMode.,
        color: primaryColor,
        theme: ThemeData(textTheme: GoogleFonts.openSansTextTheme()),
        debugShowCheckedModeBanner: false,
        routes: {
          "/intropage": (context) => HomePage(),
          '/menu': (context) => MenuPage(),
          '/tilepage': (context) => TilePage(),
          '/shoppingpage': (context) => ShoppingPage(),
        },
        home: HomePage(),
        // home: Scaffold(
        //     backgroundColor: Colors.red,
        //     extendBodyBehindAppBar: true,
        //     appBar: AppBar(
        //       shadowColor: Colors.transparent,
        //       backgroundColor: Colors.transparent,
        //       systemOverlayStyle: const SystemUiOverlayStyle(
        //         statusBarColor: Colors.transparent,
        //         statusBarIconBrightness: Brightness.dark,
        //       ),
        //     ),
        //     body: MaterialApp(
        //       home: HomePage(),
        //       debugShowCheckedModeBanner: false,
        //     )),
      ),
    );
  }
}
