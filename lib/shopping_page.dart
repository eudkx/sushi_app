import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/colors.dart';
import 'package:sushi_app/menu_page.dart';
import 'package:sushi_app/my_button.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double allCosts = 0;
    Provider.of<AllData>(context, listen: true).food_cart.forEach((element) {
      allCosts += element.price * element.counter;
    });
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   child: ,
              // ),
              Container(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/menu');
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 24),
                          child: GestureDetector(
                            // onTap: () => print(1),
                            child: const Text(
                              'Back to Menu',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        'Shopping Cart',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Consumer<AllData>(
                      builder: (context, value, child) {
                        if (value.food_cart.isEmpty) {
                          return const Text(
                              'Your cart is empty right now! You can order whatever you want from menu!');
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              // decoration: BoxDecoration(color: primaryColor),
                              width: MediaQuery.of(context).size.width,
                              height: 500,
                              child: ListView.builder(
                                itemCount: value.food_cart.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 50,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          value.food_cart[index].pathToImage,
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child:
                                              Text(value.food_cart[index].name),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  'Total cost: ${value.food_cart[index].price * value.food_cart[index].counter}'),
                                              GestureDetector(
                                                onTap: () => Provider.of<
                                                            AllData>(context,
                                                        listen: false)
                                                    .removeCurrentItemFromFoodCart(
                                                        index),
                                                child: const Icon(Icons.cancel),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total price: $allCosts',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Mybutton(
                      text: Text(
                        'Order Right Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
