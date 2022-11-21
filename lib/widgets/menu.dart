import 'package:eflatun_task/utils/constants.dart';
import 'package:flutter/material.dart';

// main menu, mobile ignored

class AppMenu extends StatefulWidget {
  const AppMenu({Key? key}) : super(key: key);

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  List menu = [
    {
      'title': 'Home',
      'current': false,
      'path': '/',
    },
    {
      'title': 'Shop',
      'current': true,
      'path': '/shop',
    },
    {
      'title': 'Blog',
      'current': false,
      'path': '/blog',
    },
    {
      'title': 'Contact',
      'current': false,
      'path': '/contact',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: menu
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    item['title'],
                    style: TextStyle(
                      color: item['current'] ? kSelectedTextColor : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
