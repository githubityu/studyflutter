import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/util/device_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// create at 2022/1/7 17:30
/// by githubityu
/// describe：

class WebPage extends HookWidget {
  final String title;
  final String url;

  WebPage(this.title, this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final  Completer<WebViewController> _controller  = useMemoized((){
       return Completer<WebViewController>();
    });
    final _progressValue = useState(0);
    useEffect(() {
      if (Device.isAndroid) {
        WebView.platform = SurfaceAndroidWebView();
      }
    }, []);
    return FutureBuilder<WebViewController>(builder: (context,snapshot){
      return WillPopScope(
        onWillPop: () async {
          if (snapshot.hasData) {
            final bool canGoBack = await snapshot.data!.canGoBack();
            if (canGoBack) {
              // 网页可以返回时，优先返回上一页
              await snapshot.data!.goBack();
              return Future.value(false);
            }
          }
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: Constants.isCenterTitle,
            title: Text(title),
          ),
          body: Stack(
            children: [
              WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                allowsInlineMediaPlayback: true,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                onProgress: (int progress) {
                  debugPrint('WebView is loading (progress : $progress%)');
                  _progressValue.value = progress;
                },
              ),
              if (_progressValue.value != 100) LinearProgressIndicator(
                value: _progressValue.value / 100,
                backgroundColor: Colors.transparent,
                minHeight: 2,
              ) else const SizedBox.shrink(),
            ],
          ),
        ),
      );

    },future: _controller.future);
  }
}
