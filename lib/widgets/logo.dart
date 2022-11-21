import 'package:eflatun_task/widgets/icon_base.dart';
import 'package:flutter/material.dart';

// App logo, can be used as a button to pop the current page

class Logo extends StatelessWidget {
  final bool shouldPop;
  const Logo({Key? key, this.shouldPop = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconBase(
          icon: shouldPop ? Icons.chevron_left : Icons.apps_rounded,
          onTap: shouldPop
              ? () {
           
                  Navigator.pop(context);
                }
              : null,
        ),
        const SizedBox(width: 10),
        const MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            'shophub',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}
