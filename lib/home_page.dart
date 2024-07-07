import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/colors.dart';
import 'package:sushi_app/my_button.dart';

// SystemChrome.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent,
        //   statusBarIconBrightness: Brightness.dark,
        // ),
        systemOverlayStyle:
            SystemUiOverlayStyle(systemNavigationBarColor: primaryColor),
      ),
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'SUSHI MAN',
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        offset: Offset(0.1, 0.5),
                        spreadRadius: 0)
                  ]),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('./lib/images/free-icon-sushi-3183483.png'),
            ),
            Text(
              'THE TASTE OF JAPANESE FOOD',
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        offset: Offset(0.1, 0.5),
                        spreadRadius: 0)
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Feel the taste of the most popular Japanese food from anywhere and anytime',
              style: TextStyle(height: 2, color: Colors.grey[200]),
            ),
            const SizedBox(
              height: 10,
            ),
            Mybutton(
              text: Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
            )
          ],
        ),
      ),
    );
  }
}
