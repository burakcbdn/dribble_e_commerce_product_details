import 'dart:math';

import 'package:eflatun_task/utils/constants.dart';
import 'package:eflatun_task/widgets/background_decor_ball.dart';
import 'package:flutter/material.dart';

// default blur and gradient background

class AppBackground extends StatelessWidget {
  const AppBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double defaultRadius = MediaQuery.of(context).size.width - 400;

    double radius = defaultRadius <= 0 ? 0 : defaultRadius;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            // first container which contains decor balls and rings
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              clipBehavior: Clip.hardEdge,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFfdb719),
                ),
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    const Positioned(
                      left: -500,
                      top: -400,
                      child: BackgroundDecorBall(
                        blur: 30,
                      ),
                    ),
                    const Positioned(
                      left: 500,
                      top: -350,
                      child: BackgroundDecorBall(
                        blur: 30,
                      ),
                    ),
                    const Positioned(
                      top: -500,
                      left: 0,
                      child: BackgroundDecorBall(),
                    ),
                    Positioned(
                      top: -300,
                      left: (MediaQuery.of(context).size.width / 2) - 300,
                      child: CustomPaint(
                        size: const Size(600, 600),
                        painter: RingPainter(),
                      ),
                    ),
                    Positioned(
                      top: -200,
                      left: (MediaQuery.of(context).size.width / 2) - 200,
                      child: CustomPaint(
                        size: const Size(400, 400),
                        painter: RingPainter1(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // decoration at the bottom with 2 rings with shadow
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: MediaQuery.of(context).size.width - 100,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kSelectedTextColor.withOpacity(0.2),
                    width: 2,
                  ),
                  color: kBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: kSelectedTextColor.withOpacity(0.1),
                      blurRadius: 600,
                      spreadRadius: 30,
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    height: radius,
                    width: radius,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kSelectedTextColor.withOpacity(0.2),
                        width: 2,
                      ),
                      color: kBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: kSelectedTextColor.withOpacity(0.1),
                          blurRadius: 600,
                          spreadRadius: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// used to draw rings around ball
class RingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;
    //Paint to draw ring shape
    Paint paint = Paint()
      ..color = color1
      ..strokeWidth = 100.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint border1 = Paint()
      ..color = kWhite.withOpacity(0.2)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //defining Center of Box
    Offset center = Offset(width / 2, height / 2);
    //defining radius
    double radius = min(width / 2, height / 2);
    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius + min(width / 8, height / 8) - 23, border1);
    canvas.drawCircle(center, radius + min(width / 8, height / 8) - 123, border1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RingPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;
    //Paint to draw ring shape
    Paint paint = Paint()
      ..color = color2
      ..strokeWidth = 100.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint border1 = Paint()
      ..color = kWhite.withOpacity(0.2)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //defining Center of Box
    Offset center = Offset(width / 2, height / 2);
    //defining radius
    double radius = min(width / 2, height / 2);
    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius + min(width / 8, height / 8) - 100, border1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
