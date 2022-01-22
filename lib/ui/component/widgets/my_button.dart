import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/number_size.dart';

/// create at 2022/1/4 15:24
/// by githubityu
/// describe：

//包含还是填充
//图标位置
// theme

class MyButton extends HookWidget {
  final MainAxisSize mainAxisSize;
  final Axis direction;
  final VoidCallback? onPressed;
  final double? minHeight;
  final double? minWidth;
  final String text;

  // final double? fontSize;
  // final Color? textColor;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderSide side;

  // final Color? disabledTextColor;
  // final Color? backgroundColor;
  // final Color? disabledBackgroundColor;
  final Widget? icon;
  final TextStyle? textStyle;
  final AppTheme theme;

  MyButton(
      {Key? key,
      mainAxisSize,
      this.direction = Axis.horizontal,
      required this.onPressed,
      this.text = "",
      TextStyle? textStyle,
      required this.theme,
      double? minHeight,
      double? minWidth,
      this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
      this.radius = 2.0,
      this.side = BorderSide.none,
      this.icon})
      : minHeight = minHeight ?? 48,
        minWidth = minWidth ?? double.infinity,
        textStyle = textStyle ?? theme.textTheme.h40,
        mainAxisSize = mainAxisSize ?? MainAxisSize.max,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
              Size(minWidth!.rpx, minHeight!.rpx)),
          // 文字颜色
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return theme.appColors.btnTextColor;
              }
              return theme.appColors.btnTextColor;
            },
          ),
          // 背景颜色
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return theme.appColors.disabled;
            }
            return theme.appColors.btnBgColor;
          }),
          // 水波纹
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return theme.appColors.btnTextColor.withOpacity(0.12);
          }),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.rpx),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(side),
        ),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: mainAxisSize,
          direction: direction,
          children: _buildChildren(),
        ));
  }

  List<Widget> _buildChildren() {
    final widgets = <Widget>[];
    if (icon != null) {
      widgets.add(icon!);
    }
    widgets.add(Text(text, style: textStyle));
    return widgets;
  }
}
