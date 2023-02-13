import 'package:flutter/material.dart';

class SimplePillWidget extends StatefulWidget {
  final Function(String) callback;
  final bool isSelected;
  final String title;

  SimplePillWidget(this.callback, this.isSelected, this.title, {Key? key}) : super(key: key);

  @override
  State<SimplePillWidget> createState() => _SimplePillWidgetState();
}

class _SimplePillWidgetState extends State<SimplePillWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.callback(widget.title);
      },
      child: IntrinsicWidth(
        child: Container(
          // width: 80,
          decoration: BoxDecoration(
              border: Border.all(
                color: widget.isSelected ? Colors.green : Colors.grey.shade300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 10),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: widget.isSelected ? Colors.green : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
