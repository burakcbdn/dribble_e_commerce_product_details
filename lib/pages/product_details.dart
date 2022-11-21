import 'package:eflatun_task/models/product.model.dart';
import 'package:eflatun_task/utils/cart_notifier.dart';
import 'package:eflatun_task/utils/constants.dart';
import 'package:eflatun_task/widgets/background.dart';
import 'package:eflatun_task/widgets/main_app_bar.dart';
import 'package:eflatun_task/widgets/option_widget.dart';
import 'package:eflatun_task/widgets/size_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ScrollController scrollController = ScrollController();

  int selectedIndex = 2;

  int selectedColor = 1;

  int currentSize = 38;

  // color options
  Map<int, Color> colors = {
    1: const Color(0xFFff6b01),
    2: const Color(0xFF45409c),
    3: const Color(0xFF01af67),
  };

  @override
  Widget build(BuildContext context) {
    // responsive screen size breakpoints
    Size screenSize = MediaQuery.of(context).size;

    bool vertical = screenSize.width <= 1035;
    bool mobile = screenSize.width <= 600;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Hero(
          tag: 'appbar',
          child: createAppBar(context, details: true),
        ),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              const Hero(tag: 'back', child: AppBackground()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 56,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Home ',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // go to home page
                                                Navigator.pop(context);
                                              }),
                                        const TextSpan(
                                          text: '/ Details',
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
                                  flex: 2,
                                ),
                                const Center(
                                  child: Text(
                                    'Details',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                if (!vertical)
                                  const Spacer(
                                    flex: 2,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(height: 40),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  color: kWhite,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: RadialGradient(
                                        radius: 0.5,
                                        colors: [
                                          kSelectedTextColor.withOpacity(0.4),
                                          kSelectedTextColor.withOpacity(0.1),
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: SingleChildScrollView(
                                        controller: scrollController,
                                        child: Flex(
                                          // flex used to make the details responsive [horizontal, vertical]
                                          direction: vertical ? Axis.vertical : Axis.horizontal,
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            // name and description
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${widget.product.name} to ${widget.product.special}',
                                                      style: const TextStyle(
                                                        fontSize: 28,
                                                        fontWeight: FontWeight.w700,
                                                        color: Color(
                                                          0xFF47429c,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      widget.product.description,
                                                      style: const TextStyle(color: Colors.grey),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    SingleChildScrollView(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [1, 2, 3].map<Widget>((e) {
                                                          bool selected = selectedIndex == e;

                                                          return GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                selectedIndex = e;
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                                              child: Container(
                                                                height: 50,
                                                                width: 50,
                                                                padding: const EdgeInsets.all(10),
                                                                decoration: BoxDecoration(
                                                                  color: selected ? kSelectedTextColor.withOpacity(0.7) : kWhite,
                                                                  borderRadius: BorderRadius.circular(10),
                                                                ),
                                                                child: Image.asset(
                                                                  widget.product.image,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // image and price
                                            Center(
                                              child: Container(
                                                height: 300,
                                                width: 300,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: RadialGradient(
                                                    colors: [
                                                      kBackgroundColor,
                                                      kWhite,
                                                    ],
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          gradient: RadialGradient(
                                                            colors: [
                                                              kSelectedTextColor.withOpacity(0.1),
                                                              kWhite.withOpacity(0.5),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: const Alignment(0, -0.7),
                                                      child: SizedBox(
                                                        height: 170,
                                                        width: 170,
                                                        child: Image.asset(widget.product.image),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: const Alignment(0, 0.8),
                                                      child: Text(
                                                        r'$' + widget.product.price.toString(),
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Color(
                                                            0xFF47429c,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            // options
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  top: 20,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    OptionWidget(
                                                        title: 'Review: ',
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [1, 2, 3, 4, 5].map<Widget>((e) {
                                                            return Icon(
                                                              Icons.star,
                                                              color:
                                                                  e != 5 ? kSelectedTextColor.withOpacity(0.7) : kSelectedTextColor.withOpacity(0.1),
                                                            );
                                                          }).toList(),
                                                        )),
                                                    const SizedBox(height: 10),
                                                    OptionWidget(
                                                        title: 'Color: ',
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [1, 2, 3].map<Widget>((e) {
                                                            bool selected = selectedColor == e;

                                                            return GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  selectedColor = e;
                                                                });
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                width: 25,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: colors[e]!.withOpacity(0.1),
                                                                  border: selected ? Border.all(color: colors[e]!, width: 0.5) : null,
                                                                ),
                                                                child: Center(
                                                                  child: Container(
                                                                    height: 20,
                                                                    width: 20,
                                                                    decoration: BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      color: colors[e],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }).toList(),
                                                        )),
                                                    const SizedBox(height: 10),
                                                    SizedBox(
                                                      child: Flex(
                                                        direction: mobile ? Axis.vertical : Axis.horizontal,
                                                        mainAxisSize: MainAxisSize.min,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const Padding(
                                                            padding: EdgeInsets.only(top: 5),
                                                            child: SizedBox(
                                                              width: 55,
                                                              child: Text(
                                                                'Size: ',
                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 10),
                                                          Column(
                                                            children: [
                                                              Row(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [37, 38, 39].map<Widget>(
                                                                  (e) {
                                                                    return GestureDetector(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          currentSize = e;
                                                                        });
                                                                      },
                                                                      child: SizeContainer(
                                                                        size: e,
                                                                        currentSize: currentSize,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).toList(),
                                                              ),
                                                              Row(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [40, 41, 42].map<Widget>(
                                                                  (e) {
                                                                    return GestureDetector(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          currentSize = e;
                                                                        });
                                                                      },
                                                                      child: SizeContainer(
                                                                        size: e,
                                                                        currentSize: currentSize,
                                                                      ),
                                                                    );
                                                                  },
                                                                ).toList(),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // add to cart button
                                                    const SizedBox(height: 10),
                                                    Center(
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 40,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            if (cartNotifier.contains(widget.product)) {
                                                              cartNotifier.remove(widget.product);
                                                            } else {
                                                              cartNotifier.add(widget.product);
                                                            }

                                                            setState(() {});
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            primary: kSelectedTextColor,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            cartNotifier.contains(widget.product) ? 'Remove from cart' : 'Add to cart',
                                                            style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                              height: 100,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
