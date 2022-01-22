import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:studyflutter/ui/component/widgets/app_logo_text.dart';
import 'package:studyflutter/ui/component/widgets/styled_spacers.dart';
import 'package:studyflutter/ui/component/widgets/ui_text.dart';
import 'package:studyflutter/util/extension/number_size.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FadeOut(
              delay: const Duration(microseconds: 500),
              child: FadeIn(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const AppLogoText(),
                      VSpace.sm,
                      UiText(
                        span: TextSpan(children: [
                          TextSpan(
                              text: "by", style: TextStyle(fontSize: 24.rpx)),
                          TextSpan(
                              text: "ityu", style: TextStyle(fontSize: 24.rpx))
                        ]),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
