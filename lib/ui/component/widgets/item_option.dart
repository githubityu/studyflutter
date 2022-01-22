import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiver/strings.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/number_size.dart';

import 'my_icon.dart';

/// create at 2022/1/12 15:32
/// by githubityu
/// describe：

class ItemOption extends StatelessWidget {
  final Widget? image;
  final String title;
  final double? minVerticalPadding;
  final AppTheme theme;
  final bool isShowDivider;
  final String endText;
  final TextStyle endStyle;
  final bool showRight;
  final GestureTapCallback? onTap;

  ItemOption(this.title,
      {Key? key,
      this.image,
      required this.theme,
      this.onTap,
      this.endText = "",
      TextStyle? endStyle,
      this.showRight = true,
      this.minVerticalPadding,
      double? imageWidth,
      bool? isShowDivider})
      : isShowDivider = isShowDivider ?? true,
        endStyle = endStyle ?? theme.textTheme.h40.copyWith(color: Colors.grey),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          minVerticalPadding: minVerticalPadding != null
              ? minVerticalPadding!.rpx
              : minVerticalPadding,
          onTap: onTap,
          dense: true,
          horizontalTitleGap: 0,
          tileColor: Colors.white,
          leading: image,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                child: Text(
                  endText,
                  style: endStyle,
                ),
                visible: isNotBlank(endText),
              ),
              Visibility(
                child: MyIcon(
                  FontAwesomeIcons.angleRight,
                  color: Colors.grey,
                  size: 20,
                  padding: EdgeInsets.only(left: 10.rpx),
                ),
                visible: showRight,
              ),
            ],
          ),
          title: Text(
            title,
            style: theme.textTheme.h40,
          ),
        ),
        Visibility(
          child: Divider(
            thickness: 0.5.rpx,
            height: 0.5.rpx,
          ),
          visible: isShowDivider,
        )
      ],
    );
  }
}
