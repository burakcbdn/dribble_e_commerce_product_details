import 'package:eflatun_task/models/product.model.dart';
import 'package:eflatun_task/widgets/product_widget.dart';
import 'package:eflatun_task/widgets/scroll_down_bar.dart';
import 'package:eflatun_task/widgets/sorting_bar.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel> products = [
    // list of shoe products
    ProductModel(
      name: 'Nike Air Max 270',
      price: 236.99,
      image: 'assets/1.png',
      mainColor: const Color(0xFFff6b01),
      description:
          'The Nike Air Max 270 React ENG is a new take on the Air Max 270 React. It features a React foam midsole and a Max Air unit in the heel for a comfortable ride. The upper is made of a mix of mesh and synthetic materials.',
      special: 'Chuck Taylors',
    ),

    ProductModel(
      name: 'Nike Air Max 280',
      price: 199.99,
      image: 'assets/2.png',
      mainColor: const Color(0xFF45409c),
      description:
          'The Nike Air Max 270 React ENG is a new take on the Air Max 270 React. It features a React foam midsole and a Max Air unit in the heel for a comfortable ride. The upper is made of a mix of mesh and synthetic materials.',
      special: 'Chuck Taylors',
    ),
    ProductModel(
      name: 'Nike Air Max 290',
      price: 209.99,
      image: 'assets/3.png',
      mainColor: const Color(0xFF01af67),
      description:
          'The Nike Air Max 270 React ENG is a new take on the Air Max 270 React. It features a React foam midsole and a Max Air unit in the heel for a comfortable ride. The upper is made of a mix of mesh and synthetic materials.',
      special: 'Chuck Taylors',
    ),
    ProductModel(
      name: 'Nike Air Max 260',
      price: 299.99,
      image: 'assets/3.png',
      mainColor: const Color(0xFF01af67),
      description:
          'The Nike Air Max 270 React ENG is a new take on the Air Max 270 React. It features a React foam midsole and a Max Air unit in the heel for a comfortable ride. The upper is made of a mix of mesh and synthetic materials.',
      special: 'Chuck Taylors',
    ),

    ProductModel(
      name: 'Nike Air Max 310',
      price: 199.99,
      image: 'assets/1.png',
      mainColor: const Color(0xFFff6b01),
      description:
          'The Nike Air Max 270 React ENG is a new take on the Air Max 270 React. It features a React foam midsole and a Max Air unit in the heel for a comfortable ride. The upper is made of a mix of mesh and synthetic materials.',
      special: 'Chuck Taylors',
    ),
    ProductModel(
      name: 'Nike Air Max 320',
      price: 499.99,
      image: 'assets/2.png',
      mainColor: const Color(0xFF45409c),
      description:
          'The Nike Air Max 270 React ENG is a new take on the Air Max 270 React. It features a React foam midsole and a Max Air unit in the heel for a comfortable ride. The upper is made of a mix of mesh and synthetic materials.',
      special: 'Chuck Taylors',
    ),
  ];

  // controller is used to scroll to show scroll bar on the left side
  ScrollController scrollController = ScrollController();

  // sort products by price or name
  void sortProducts(String type) {
    switch (type) {
      case 'price':
        setState(() {
          products.sort((a, b) => a.price.compareTo(b.price));
        });
        break;
      case 'name':
        setState(() {
          products.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {

    // responsive design breakpoints
    Size screenSize = MediaQuery.of(context).size;

    bool mobile = screenSize.width <= 710;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScrollDownBar(
              controller: scrollController,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Home ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: '/ Product',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      const Center(
                        child: Text(
                          'Shop',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // show sorting bar and result count on bottom on mobile
                      if (!mobile)
                        const Spacer(
                          flex: 2,
                        ),
                      if (!mobile)
                        SortingBar(
                          onChanged: (s) {
                            print(s);
                            if (s == null) {
                              return;
                            }
                            sortProducts(s);
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (mobile)
                    SortingBar(
                      mobile: true,
                      onChanged: (s) {
                        if (s == null) {
                          return;
                        }
                        sortProducts(s);
                      },
                    ),
                  const SizedBox(height: 40),
                  // List of products responsive grid
                  Expanded(
                    child: GridView.count(
                      controller: scrollController,
                      crossAxisCount: screenSize.width <= 660
                          ? 1
                          : screenSize.width <= 940
                              ? 2
                              : 3,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 40,
                      childAspectRatio: 3 / 3.6,
                      padding: const EdgeInsets.only(bottom: 70),
                      children: products
                          .map<Widget>(
                            (e) => ProductWidget(
                              product: e,
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
