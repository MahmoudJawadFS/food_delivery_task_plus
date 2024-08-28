import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/coupon_page.dart';
import 'package:food_delivery/views/pages/order_page.dart';
import 'package:food_delivery/views/widgets/orders_coupons_widget.dart';
import 'package:food_delivery/views/widgets/profile_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              CircleAvatar(
                radius:
                    size.width > 800 ? size.height * 0.2 : size.height * 0.1,
                backgroundImage: const NetworkImage(
                  'https://images.inc.com/uploaded_files/image/1920x1080/getty_481292845_77896.jpg',
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Ahmed Mohamed',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6.0),
              const Text(
                'Software Engineer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 24.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrdersCouponsWidget(
                    title: 'Orders',
                    value: 10,
                  ),
                  SizedBox(
                    height: 45,
                    child: VerticalDivider(),
                  ),
                  OrdersCouponsWidget(
                    title: 'Coupons',
                    value: 5,
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const order_page()),
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        child: const Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Orders",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const coupon_page()),
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        child: const Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.card_giftcard,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Coupons",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
