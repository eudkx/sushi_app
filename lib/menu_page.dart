import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/colors.dart';
import 'package:sushi_app/food.dart';
import 'package:sushi_app/food_cart.dart';
import 'package:sushi_app/food_tile.dart';
import 'dart:io';
import 'package:sushi_app/my_button.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/shopping_page.dart';

class AllData extends ChangeNotifier {
  bool isSideBarActive = true;
  int currentIndex = 0;
  double totalPrice = 0;
  final List<Food> foodList = [
    Food(
        name: 'Salmon Sushi',
        imagePath: "lib/images/free-icon-sushi-3183510.png",
        price: 21.00,
        rating: '4.9',
        ingredients: [
          'Rice',
          'Salmon',
          'Mayoanaise sauce',
          'Nori',
          'Watashi Sauce',
          'Cucumber'
        ],
        title:
            'This sushi is a classic combination of fresh salmon, creamy avocado, and crunchy cucumber, wrapped in a delicate layer of sushi rice and enveloped in a seaweed nori. Each piece of sushi offers a perfect balance of textures and flavors, with the juiciness of the salmon, creaminess of the avocado, and freshness of the cucumber. Served with soy sauce, ginger, and wasabi, this sushi will delight your taste buds and leave you craving for more.'),
    Food(
        name: 'tuna',
        imagePath: "lib/images/free-icon-sushi-3183509.png",
        price: 19.00,
        rating: '4.6',
        ingredients: [
          'Rice',
          'Tuna',
          'Green Salad',
          'Nori',
          'Cheese',
          'Cucumber'
        ],
        title:
            'Prepared with love, this sushi is an exotic fusion of shrimp, spicy mayonnaise, and crunchy tobiko seaweed, wrapped in a layer of sushi rice. Each bite of this sushi bursts in your mouth with a combination of the seafood flavor from the shrimp and the spiciness of the mayo. This sushi is a flavor explosion that will keep you coming back for more. Served with soy sauce, ginger, and wasabi, this dish is guaranteed to impress with its exquisite taste and originality.'),
  ];

  List<FoodCart> food_cart = [
    // FoodCart(name: 'name', price: 1.0, pathToImage: 'pathToImage', counter: 0),
  ];
  void sumOfAllProducts() {
    food_cart.forEach((element) {
      totalPrice += element.price * element.counter;
    });
    notifyListeners();
    // return totalPrice;
  }

  void removeCurrentItemFromFoodCart(int index) {
    food_cart.removeAt(index);
    notifyListeners();
  }

  void setNewisSideBarActive() {
    isSideBarActive = !isSideBarActive;
    notifyListeners();
  }

  void setNewCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void addToFoodCart(String name, double price, String path, int counter) {
    food_cart.add(FoodCart(
        name: name, price: price, pathToImage: path, counter: counter));
  }
}

class FoodCartData extends ChangeNotifier {
  List<FoodCart> cart = [];
}

// useState
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // final List<Food> foodList = [
  //   Food(
  //       name: 'Salmon Sushi',
  //       imagePath: "lib/images/free-icon-sushi-3183510.png",
  //       price: "21.00\$",
  //       rating: '4.9'),
  //   Food(
  //       name: 'tuna',
  //       imagePath: "lib/images/free-icon-sushi-3183509.png",
  //       price: "19.00\$",
  //       rating: '4.6'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: Colors.grey[300],
            systemNavigationBarColor: Colors.grey[300]),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Provider.of<AllData>(context, listen: false)
                  .setNewisSideBarActive();
            },
            child: Icon(
              Icons.menu,
              color: Colors.grey[700],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 100,
              // ),
              Container(
                margin: const EdgeInsets.all(26),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 135, 135, 135),
                          offset: Offset(1, 1),
                          spreadRadius: 0.1)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Get 32% promo',
                            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Mybutton(
                          text: Text(
                            "Redeem",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'lib/images/free-icon-sushi-3183521.png',
                          height: 100,
                        ),
                        // Container(
                        //   height: 20,
                        //   width: 70,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(2000),
                        //       boxShadow: [BoxShadow(color: Colors.black)]),
                        // ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(200),
                        //   clipBehavior: Clip.hardEdge,
                        //   child: Container(
                        //       height: 50,
                        //       width: 100,
                        //       decoration: BoxDecoration(color: Colors.black)),
                        // )
                        // CircleBorder()
                        // RoundedRectangleBorder()
                        CustomPaint(
                          size: const Size(80, 20),
                          painter: LinePainter(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  // controller: _controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Food List',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                // flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Consumer<AllData>(
                    builder: (context, value, child) {
                      return ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView.builder(
                          addRepaintBoundaries: false,
                          // keyboardDismissBehavior:
                          // ScrollViewKeyboardDismissBehavior.onDrag,

                          scrollDirection: Axis.horizontal,
                          itemCount: value.foodList.length,
                          itemBuilder: (context, index) {
                            // Provider.of<AllData>

                            return FoodTile(
                              food: value.foodList[index],
                              index: index,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              Container(
                padding: const EdgeInsets.only(
                    right: 25, left: 25, bottom: 0, top: 0),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      // primaryColor,
                      Color.fromARGB(255, 218, 218, 218),
                      Color.fromARGB(255, 188, 188, 188),
                      Color.fromARGB(255, 186, 186, 186),
                      // primaryColor,
                      // primaryLighterColor
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/images/free-icon-sushi-3183520.png',
                      height: 80,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(children: [
                      Text(
                        'Okitashu Sushi',
                        style: GoogleFonts.dmSerifDisplay(fontSize: 21),
                      ),
                      // Mybutton(text: Text('Check here'))
                      Row(children: const [
                        Text(
                          'Check out the new taste',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward)
                      ])
                    ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),

          Positioned(
            child:
                (Provider.of<AllData>(context, listen: true).isSideBarActive ==
                        false)
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Provider.of<AllData>(context, listen: true)
                                    .isSideBarActive
                                ? Color.fromARGB(0, 0, 0, 0)
                                : Color.fromARGB(90, 0, 0, 0)),
                      )
                    : Container(
                        height: 0,
                        width: 0,
                      ),
          ),
          Consumer<AllData>(
            builder: (context, value, child) {
              print(value.isSideBarActive);
              return AnimatedPositioned(
                duration: new Duration(milliseconds: 200),
                left: value.isSideBarActive ? -200 : 0,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  // duration: Duration(milliseconds: 500),
                  width: 200,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Provider.of<AllData>(context, listen: false)
                              .setNewisSideBarActive();
                          Timer(const Duration(seconds: 1), () {
                            Navigator.pushNamed(context, '/shoppingpage');
                          });
                        },
                        child: Text(
                          'Shopping Cart',
                          style: GoogleFonts.openSans(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          // child:
          // )
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 15;

    // Offset start = Offset(0, size.height / 2);
    // Offset end = Offset(size.width, size.height / 2);

    // canvas.drawCircle(start, 10, paint);

    var path = Path();

    path.moveTo(0, 0);
    path.addOval(
        Rect.fromCenter(center: Offset(40, 10), width: 100, height: 10));
    // path.arcTo(
    //     Rect.fromCircle(center: Offset(100, 50), radius: 100), 0, -pi, true);
    // path.quadraticBezierTo(100, 50, 200, 0);
    // path.quadraticBezierTo(100, 50, -50, -10);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
