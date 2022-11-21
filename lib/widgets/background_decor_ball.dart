import 'dart:ui';

import 'package:eflatun_task/utils/constants.dart';
import 'package:flutter/material.dart';

// blurred ball for decoration container

class BackgroundDecorBall extends StatelessWidget {
  final double blur;
  const BackgroundDecorBall({Key? key, this.blur = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        height: 1000,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  kSelectedTextColor,
                  kWhite,
                ],
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur,
                sigmaY: blur,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
