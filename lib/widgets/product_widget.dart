import 'package:eflatun_task/models/product.model.dart';
import 'package:eflatun_task/pages/product_details.dart';
import 'package:eflatun_task/utils/constants.dart';
import 'package:eflatun_task/widgets/icon_base.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              product: product,
            ),
          ),
        );
      },
      // cursor: pointer
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: LayoutBuilder(builder: (context, con) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              constraints: const BoxConstraints(maxWidth: 200),
              child: Stack(
                children: [
                  // Background gradient
                  Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 0.5,
                        colors: [
                          kSelectedTextColor.withOpacity(0.5),
                          kSelectedTextColor.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          // upper icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              IconBase(
                                icon: Icons.aspect_ratio,
                                product: true,
                              ),
                              IconBase(
                                icon: Icons.shopping_basket_sharp,
                                product: true,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // product image and background
                          Container(
                            decoration: const BoxDecoration(),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(
                                    height: con.maxHeight / 3.5,
                                    decoration: BoxDecoration(
                                      color: product.mainColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    // clips the circle inside rectangle with little overflow
                                    child: ClipRect(
                                      clipBehavior: Clip.hardEdge,
                                      child: OverflowBox(
                                        maxHeight: (con.maxHeight / 3.5) + 10,
                                        maxWidth: (con.maxHeight / 3.5) + 10,
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: color1,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: kWhite,
                                                width: 3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                
                                Center(
                                  child: SizedBox(
                                    height: con.maxHeight / 2,
                                    width: con.maxHeight / 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Image.asset(product.image),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(
                                0xFF47429c,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            r'$' + product.price.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(
                                0xFF47429c,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
