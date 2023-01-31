import 'package:flutter/material.dart';

import '../Globals.dart';

class PillButton extends StatefulWidget {
  final String title;
  final Color fillColor;
  final Color borderColor;
  final Color titleColor;
  final bool isDropDown;
  final bool isSelected;
  final int? qty;
  final Function(String) callback;

  PillButton(this.title, this.qty, this.isSelected, this.fillColor, this.borderColor, this.titleColor, this.isDropDown,
      this.callback)
      : super();

  @override
  State<PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<PillButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.callback(widget.title);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: widget.isDropDown
                ? Row(
              children: [
                Text(
                  '${widget.title} (${widget.qty})',
                  style: TextStyle(color: widget.isSelected ? Colors.white : widget.titleColor),
                ),
                SizedBox(
                  height: 15,
                  width: 25,
                  child: Stack(
                    children: [
                      Positioned(top: -3, right: 0, child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ],
            )
                : widget.qty != null
                ? Text(
              '${widget.title} (${widget.qty})',
              style: TextStyle(color: widget.isSelected ? Colors.white : widget.titleColor),
            )
                : Text(
              '${widget.title}',
              style: TextStyle(color: widget.isSelected ? Colors.white : widget.titleColor),
            ),
          ),
          decoration: new BoxDecoration(
              border: Border.all(color: widget.isSelected ? Colors.orange : widget.borderColor),
              color: widget.isSelected ? Colors.orange : widget.fillColor,
              borderRadius: new BorderRadius.all(Radius.circular(15))),
        ),
      ),
    );
  }
}