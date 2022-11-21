import 'package:eflatun_task/widgets/cart.dart';
import 'package:eflatun_task/widgets/icon_base.dart';
import 'package:eflatun_task/widgets/logo.dart';
import 'package:eflatun_task/widgets/menu.dart';
import 'package:flutter/material.dart';

// display responsive app bar

PreferredSizeWidget createAppBar(BuildContext context, {bool details = false}) {
  return AppBar(
    automaticallyImplyLeading: !details,
    toolbarHeight: 100,
    title: LayoutBuilder(builder: (context, con) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(
            shouldPop: details,
          ),
          if (con.maxWidth > 660) const Center(child: AppMenu()),
          if (con.maxWidth > 660) const Cart(),
          if (con.maxWidth <= 660)
            const IconBase(
              icon: Icons.menu,
            ),
        ],
      );
    }),
  );
}
