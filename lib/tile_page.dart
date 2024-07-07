import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/colors.dart';
import 'package:sushi_app/menu_page.dart';

class TilePageData extends ChangeNotifier {
  int counter = 1;
  bool isAddToListState = true;
  bool isAddedState = false;
  bool startAnimation = false;
  void changeIsAddToListState() {
    isAddToListState = !isAddToListState;
    notifyListeners();
  }

  void changeStartAnimation() {
    startAnimation = !startAnimation;
    notifyListeners();
  }

  void changeIsAddedState() {
    isAddToListState = !isAddToListState;
    notifyListeners();
  }

  void counterIncrease(bool isIncrease) {
    switch (isIncrease) {
      case true:
        if (counter != 1) {
          counter--;
        }
        notifyListeners();

        return;
      case false:
        counter++;
        notifyListeners();

        return;
    }
  }
}

class TilePage extends StatefulWidget {
  const TilePage({super.key});

  @override
  State<TilePage> createState() => _TilePageState();
}

class _TilePageState extends State<TilePage> {
  @override
  Widget build(BuildContext context) {
    int current_index =
        Provider.of<AllData>(context, listen: false).currentIndex;

    return ChangeNotifierProvider(
        create: (_) => TilePageData(),
        builder: (context, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark),
              backgroundColor: Colors.transparent,
              //
              leading: Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: GestureDetector(
                  onTap: (() {
                    Navigator.pushNamed(context, '/menu');
                  }),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              // titleTextStyle: TextStyle(color: Colors.grey[700], ),
              // titleSpacing: 50,

              title: Container(
                child: Consumer<AllData>(
                  builder: (context, value, child) {
                    var index = value.currentIndex;
                    return Text(
                      value.foodList[index].name,
                      style:
                          GoogleFonts.dmSerifDisplay(color: Colors.grey[700]),
                    );
                  },
                ),
              ),
            ),
            body: Consumer<AllData>(
              builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      // height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Image.asset(
                                  value.foodList[current_index].imagePath,
                                  height: 250,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    value.foodList[current_index].rating,
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                              Text(
                                value.foodList[current_index].name,
                                style: GoogleFonts.dmSerifDisplay(
                                    fontWeight: FontWeight.w200, fontSize: 30),
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.22,
                            // width: 300,
                            child: Text(
                              "武士道",
                              style: GoogleFonts.yomogi(
                                fontWeight: FontWeight.bold,
                                fontSize: 64,
                                letterSpacing: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ingredients',
                            style: GoogleFonts.openSans(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                              itemCount: value
                                  .foodList[current_index].ingredients.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.all(5),
                                  margin: EdgeInsets.only(
                                      left: (index == 0) ? 0 : 10),
                                  child: Text(
                                    value.foodList[current_index]
                                        .ingredients[index],
                                    style: GoogleFonts.openSans(fontSize: 12),
                                  ),
                                );
                              },
                            ),
                          ),
                          Text(
                            'Description',
                            style: GoogleFonts.openSans(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView(children: [
                                Text(
                                  value.foodList[current_index].title,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w200),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // margin: const EdgeInsets.only(botto),
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: Container(
                        decoration: BoxDecoration(color: primaryColor),
                        child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.34,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[500],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: GestureDetector(
                                          onTap: () {
                                            Provider.of<TilePageData>(context,
                                                    listen: false)
                                                .counterIncrease(true);
                                          },
                                          child: Icon(
                                            Icons.arrow_back,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        Provider.of<TilePageData>(context,
                                                listen: true)
                                            .counter
                                            .toString(),
                                        style: TextStyle(fontSize: 28),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[500],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: GestureDetector(
                                          onTap: () {
                                            Provider.of<TilePageData>(context,
                                                    listen: false)
                                                .counterIncrease(false);
                                          },
                                          child: Icon(
                                            Icons.arrow_forward,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //  ,     const SizedBox(
                                //         width: 15,
                                //       )
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<AllData>(context, listen: false)
                                        .addToFoodCart(
                                            value.foodList[current_index].name,
                                            value.foodList[current_index].price,
                                            value.foodList[current_index]
                                                .imagePath,
                                            Provider.of<TilePageData>(context,
                                                    listen: false)
                                                .counter);
                                    Provider.of<TilePageData>(context,
                                            listen: false)
                                        .changeStartAnimation();
                                    Timer(
                                        const Duration(milliseconds: 300),
                                        () => Provider.of<TilePageData>(context,
                                                listen: false)
                                            .changeIsAddToListState());
                                    Timer(
                                        const Duration(milliseconds: 350),
                                        () => Provider.of<TilePageData>(context,
                                                listen: false)
                                            .changeStartAnimation());
                                    Timer(
                                        const Duration(milliseconds: 600),
                                        () => Provider.of<TilePageData>(context,
                                                listen: false)
                                            .changeStartAnimation());
                                    Timer(
                                        const Duration(milliseconds: 900),
                                        () => Provider.of<TilePageData>(context,
                                                listen: false)
                                            .changeIsAddToListState());
                                    Timer(
                                        const Duration(milliseconds: 1100),
                                        () => Provider.of<TilePageData>(context,
                                                listen: false)
                                            .changeStartAnimation());
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: primaryDarkerColor,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      padding: const EdgeInsets.only(
                                          top: 24,
                                          bottom: 24,
                                          left: 36,
                                          right: 36),
                                      child:
                                          //  Provider.of<TilePageData>(context,
                                          //                 listen: false)
                                          //             .isAddedToList ==
                                          //         false
                                          AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        opacity: Provider.of<TilePageData>(
                                                        context,
                                                        listen: false)
                                                    .startAnimation ==
                                                true
                                            ? 0
                                            : 1,
                                        child: Text(
                                          Provider.of<TilePageData>(context,
                                                          listen: true)
                                                      .isAddToListState ==
                                                  true
                                              ? 'Add to Cart'
                                              : 'Added',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )
                                      // : AnimatedOpacity(
                                      //     duration: const Duration(
                                      //         milliseconds: 300),
                                      //     opacity: Provider.of<TilePageData>(
                                      //                 context,
                                      //                 listen: false)
                                      //             .isAddedToList
                                      //         ? 1
                                      //         : 0,
                                      //     child: Text(
                                      //       'Added',
                                      //       style: TextStyle(
                                      //           fontSize: 15,
                                      //           fontWeight: FontWeight.bold,
                                      //           color: Colors.white),
                                      //     ),
                                      //   ),
                                      ),
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
