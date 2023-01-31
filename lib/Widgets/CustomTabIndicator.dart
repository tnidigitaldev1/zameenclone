import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return new _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  double indicatorHeight = 40;
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    final Rect rect1 = configuration.size == null ? Rect.zero : offset & configuration.size!;
    final Rect rect = configuration.size == null
        ? Rect.zero
        : Offset(offset.dx, (configuration.size!.height / 2) - indicatorHeight / 2) &
            Size(configuration.size!.width, indicatorHeight);
    final Paint paint = Paint();
    paint.color = Colors.green.shade200;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(50.0)), paint);
  }
}
