import 'package:eflatun_task/utils/constants.dart';
import 'package:flutter/material.dart';

// Shoe size option widget

class SizeContainer extends StatefulWidget {
  final int size;
  final int currentSize;

  const SizeContainer({
    Key? key,
    required this.size,
    required this.currentSize,
  }) : super(key: key);

  @override
  State<SizeContainer> createState() => _SizeContainerState();
}

class _SizeContainerState extends State<SizeContainer> {
  @override
  Widget build(BuildContext context) {
    bool selected = widget.currentSize == widget.size;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected ? kSelectedTextColor : kWhite,
        ),
        height: 50,
        width: 60,
        child: Center(
          child: Text(widget.size.toString()),
        ),
      ),
    );
  }
}
