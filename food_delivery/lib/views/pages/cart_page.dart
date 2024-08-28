import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/views/pages/home_page.dart';
import 'package:food_delivery/views/pages/order_page.dart';
import 'package:food_delivery/views/pages/product_details_page.dart';

class CartItem {
  final ProductModel product1;
  int quantity;
  CartItem({
    required this.product1,
    required this.quantity,
  });
  double get cart_totalPrice => product1.price * quantity;
}

//-----------------------------------------------------------
class cart_page extends StatefulWidget {
  static orderItem order = orderItem();

  const cart_page({super.key});
  static double totalPrice = 0;

  static const String routeName = '/cart-page';
  @override
  _cart_pageState createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  late List<CartItem> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = ProductDetailsPage.cartProducts.isEmpty
        ? []
        : ProductDetailsPage.cartProducts;
    cart_page.order = orderItem();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //cart_page.totalPrice = 80;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cart")),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  itemCount: filteredProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 6,
                    childAspectRatio: 1.9,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final product = filteredProducts[index];

                    return LayoutBuilder(builder: (context, constraints) {
                      final maxHeight = constraints.maxHeight;
                      return SizedBox(
                        // height: 400,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            //alignment: Alignment.topLeft,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 0, 0),
                                          child: CachedNetworkImage(
                                            imageUrl: product.product1.imgUrl,
                                            height: 120,
                                            width: 120,
                                            //fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 25, 0, 0),
                                              child: Text(
                                                product.product1.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      fontSize: size.width > 1220
                                                          ? size.aspectRatio *
                                                              25
                                                          : size.aspectRatio *
                                                              35,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Text(
                                              'Quantity: ${product.quantity}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                    fontSize: size.width > 1220
                                                        ? size.aspectRatio * 25
                                                        : size.aspectRatio * 35,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Text(
                                              '\$${product.product1.price * product.quantity}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    fontSize: 20,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.grey100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        cart_page.totalPrice -=
                                            product.cart_totalPrice;
                                        filteredProducts.remove(product);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.remove,
                                        size: 25,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 85,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Text(
                    "Total Price: \$ ${cart_page.totalPrice.toStringAsFixed(3)}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        for (var x in filteredProducts) {
                          cart_page.order.carts.add(x);
                        }
                        cart_page.order.order_totalPrice = cart_page.totalPrice;
                        //cart_page.order.carts.add(filteredProducts);
                        order_page.orders.add(cart_page.order);
                        filteredProducts.clear();
                        cart_page.totalPrice = 0;
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Checkout',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
