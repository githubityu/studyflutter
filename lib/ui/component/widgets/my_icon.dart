import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studyflutter/util/extension/number_size.dart';

/// create at 2022/1/4 15:17
/// by githubityu
/// describe：

class MyIcon extends StatelessWidget {
  final IconData? icon;
  final Color color;
  final Color bgColor;
  final double size;
  final EdgeInsetsGeometry padding;

  const MyIcon(this.icon,
      {Key? key,
      Color? color,
      Color? bgColor,
      double? size,
      EdgeInsetsGeometry? padding})
      : color = color ?? Colors.black,
        bgColor = bgColor ?? Colors.transparent,
        size = size ?? 15,
        padding =
            padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(3.rpx)),
      child: Padding(
        padding: padding,
        child: FaIcon(
          icon,
          size: size.rpx,
          color: color,
        ),
      ),
    );
  }
}
