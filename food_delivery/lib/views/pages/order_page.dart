import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/cart_page.dart';

class orderItem {
  final List<CartItem> carts = [];
  late double order_totalPrice;
}

class order_page extends StatefulWidget {
  static List<orderItem> orders = [];

  const order_page({super.key});
  static double totalPrice = 0;
  @override
  _order_pageState createState() => _order_pageState();
}

class _order_pageState extends State<order_page> {
  @override
  void initState() {
    super.initState();
  }

  bool _isExpanded = false;

  void _toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Orders")),
      ),
      body: ListView.builder(
        itemCount: order_page.orders.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final orderObject = order_page.orders[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _toggleDropdown(),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 228, 224, 224),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Order ${index + 1}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  "\$${orderObject.order_totalPrice.toStringAsFixed(3)}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: Container(),
                    secondChild: Column(
                      children: List.generate(
                        orderObject.carts.length,
                        (itemIndex) {
                          final cartItem = orderObject.carts[itemIndex];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: ListTile(
                              title: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: cartItem.product1.imgUrl,
                                    width: 50,
                                    height: 50,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      cartItem.product1.name,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 3, 20, 0),
                                    child: Text(
                                      '${cartItem.quantity}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    crossFadeState: _isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: Duration(milliseconds: 300),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
