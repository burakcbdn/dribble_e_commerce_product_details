import 'package:eflatun_task/pages/home_page.dart';
import 'package:eflatun_task/utils/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(const EflatunWebApp());

class EflatunWebApp extends StatelessWidget {
  const EflatunWebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
              decorationColor: Colors.black,
            ),
      ),
      title: 'Eflatun Web App',
      home: const HomePage(),
    );
  }
}
