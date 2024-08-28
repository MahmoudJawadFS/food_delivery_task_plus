import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';

class coupon_page extends StatefulWidget {
  const coupon_page({super.key});
  @override
  _coupon_pageState createState() => _coupon_pageState();
}

class _coupon_pageState extends State<coupon_page> {
  @override
  Widget build(BuildContext context) {
    int i = -1;
    double price = 0;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Coupons")),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 18, 8),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            i += 2;
            final products = dummyProducts;
            price = (products[i].price +
                products[i + 1].price +
                products[i + 2].price);
            return Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(color: Colors.red),
                          height: 50,
                          child: Center(
                              child: Text(
                            "${50 * (i / 4)}% OFF",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )),
                        ),
                        Container(
                          // height: 160,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                            child: Column(
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: products[i].imgUrl,
                                            width: 50,
                                            height: 50,
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                          Text(
                                            products[i].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '\$${products[i].price}',
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 245, 20, 4),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.add),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: products[i + 1].imgUrl,
                                            width: 50,
                                            height: 50,
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                          Text(
                                            products[i + 1].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '\$${products[i + 1].price}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 245, 20, 4),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.add),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: products[i + 3].imgUrl,
                                            width: 50,
                                            height: 50,
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                          Text(
                                            products[i + 3].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '\$${products[i + 3].price}',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 252, 3, 3),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 10,
                        right: 15,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "\$$price",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 15, 141, 19)),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                //height: 40,
                                //width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Check Out",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
