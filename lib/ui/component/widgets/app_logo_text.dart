import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:studyflutter/gen/assets.gen.dart';

class AppLogoText extends StatelessWidget {
  const AppLogoText({Key? key, this.constraints, this.color}) : super(key: key);
  final BoxConstraints? constraints;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Widget img = Assets.images.iconPlaceholder
        .image(filterQuality: FilterQuality.high, fit: BoxFit.contain);
    return (constraints == null)
        ? img
        : ConstrainedBox(constraints: constraints!, child: img);
  }
}
