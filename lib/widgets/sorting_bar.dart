import 'package:eflatun_task/utils/constants.dart';
import 'package:flutter/material.dart';

class SortingBar extends StatefulWidget {
  final bool mobile;
  final Function(String?) onChanged;
  const SortingBar({
    Key? key,
    this.mobile = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SortingBar> createState() => _SortingBarState();
}

class _SortingBarState extends State<SortingBar> {
  String? currentSort;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '20 results',
        ),
        if (widget.mobile) const Spacer(),
        const SizedBox(width: 20),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: kWhite.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
              // dropdown button for sorting options [size, price]
              DropdownButton<String>(
                value: currentSort,
                underline: SizedBox(),
                hint: widget.mobile ? SizedBox() : Text('Sort by'),
                icon: Icon(
                  widget.mobile ? Icons.filter_list : Icons.expand_more,
                ),
                dropdownColor: kWhite,
                borderRadius: BorderRadius.circular(15),
                items: [
                  {
                    'title': 'Price',
                    'value': 'price',
                  },
                  {
                    'title': 'Name',
                    'value': 'name',
                  },
                ]
                    .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem(
                        value: e['value'],
                        child: Text(e['title']!),
                      ),
                    )
                    .toList(),
                onChanged: (s) {
                  setState(() {
                    currentSort = s;
                  });

                  // call the function from parent to update accordingly
                  widget.onChanged(s);
                },
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
