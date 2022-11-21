import 'package:eflatun_task/utils/cart_notifier.dart';
import 'package:eflatun_task/utils/constants.dart';
import 'package:eflatun_task/widgets/icon_base.dart';
import 'package:flutter/material.dart';

// card info widget at the top left

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  double total = 0;

  @override
  void initState() {
    super.initState();

    // calculate total price at init

    total = 0;
    for (var element in cartNotifier.cartItems) {
      total += element.price;
    }

    cartNotifier.addListener(() {
      // update the price when the cart changes [add, remove]
      setState(() {
        total = 0;
        for (var element in cartNotifier.cartItems) {
          total += element.price;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r'$' '$total',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconBase(
              icon: Icons.shopping_basket_sharp,
            ),
            // show the number of items in the cart if not 0
            if (cartNotifier.cartItems.length > 0)
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      cartNotifier.cartItems.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
