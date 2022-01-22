import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:studyflutter/local/constants.dart';
import 'package:studyflutter/ui/hook/use_router.dart';
import 'package:studyflutter/util/extension/object.dart';

/// create at 2022/1/11 15:48
/// by githubityu
/// describe：

class ScanCodePage extends HookConsumerWidget {
  ScanCodePage({Key? key}) : super(key: key);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller,result,router) {
    controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.dispose();
      result.value = scanData.code.nullSafe;
      router.pop<String>(result.value);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = useState("");
    final router = useRouter();
    QRViewController? controller;


    useReassemble(() {
      if (Platform.isAndroid) {
        controller?.pauseCamera();
      } else if (Platform.isIOS) {
        controller?.resumeCamera();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("扫一扫"),
        centerTitle: Constants.isCenterTitle,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller){
                _onQRViewCreated(controller,result,router);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result.value.isNotEmpty)
                  ? Text(' Data: ${result.value}')
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }
}
