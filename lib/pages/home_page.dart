import 'package:eflatun_task/pages/product_list.dart';
import 'package:eflatun_task/widgets/background.dart';
import 'package:eflatun_task/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Hero(
          tag: 'appbar',
          child: createAppBar(context),
        ),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: const [
              Hero(tag: 'back', child: AppBackground()), // using hero in the both pages to make the transition smoother
              ProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
