import 'package:flutter/material.dart';

// Wrapper widget for shoe options [color, rating]

class OptionWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const OptionWidget({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 55,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 10),
        child
      ],
    );
  }
}
