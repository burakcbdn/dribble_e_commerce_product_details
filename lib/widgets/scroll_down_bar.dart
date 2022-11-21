import 'package:flutter/material.dart';

// scroll bar on the left with vertical text

class ScrollDownBar extends StatefulWidget {
  final ScrollController controller;
  const ScrollDownBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ScrollDownBar> createState() => _ScrollDownBarState();
}

class _ScrollDownBarState extends State<ScrollDownBar> {
  bool trigger = false;

  @override
  void initState() {
    super.initState();

    // update the position of the container when the scroll position changes
    widget.controller.addListener(() {
      // do not update the position if the scroll position is not attached to any scroll view
      if (widget.controller.hasClients) {
        if (!trigger) {
          setState(() {
            trigger = true;
          });
        }
      }
      setState(() {});
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 300),
        // vertical text
        const RotatedBox(
          quarterTurns: -1,
          child: Text(
            'Scroll down',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 50,
          width: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Stack(
            children: [
              Positioned(
                // can throw null error, so check trigger first
                top: trigger ? (widget.controller.position.pixels / widget.controller.position.maxScrollExtent) * 30 : 0,
                child: Container(
                  height: 20,
                  width: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
