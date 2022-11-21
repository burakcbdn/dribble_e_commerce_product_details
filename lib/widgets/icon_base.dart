import 'package:eflatun_task/utils/constants.dart';
import 'package:flutter/material.dart';

class IconBase extends StatelessWidget {
  final IconData icon;
  final bool product;
  final Function()? onTap;

  const IconBase({
    Key? key,
    required this.icon,
    this.product = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          // fff3d6
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: product ? Border.all(color: Colors.grey) : null,
            gradient: !product
                ? const RadialGradient(
                    colors: [
                      kBackgroundColor,
                      kWhite,
                    ],
                  )
                : null,
          ),
          child: Center(
            child: Icon(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
