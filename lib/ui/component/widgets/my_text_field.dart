import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studyflutter/util/extension/clickable_extensions.dart';
import 'package:studyflutter/ui/theme/app_theme.dart';
import 'package:studyflutter/util/extension/number_size.dart';

import 'my_button.dart';
import 'my_icon.dart';

/// 登录模块的输入框封装
class MyTextField extends HookConsumerWidget {
  MyTextField(
      {Key? key,
      required this.controller,
      this.maxLength = 16,
      this.autoFocus = false,
      this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.focusNode,
      this.isInputPwd = false,
      this.border,
      this.borderType,
      this.borderRadius = 0,
      this.filled = true,
      this.fillColor = Colors.transparent,
      this.getVCode,
      this.keyName,
      required this.theme})
      : assert(borderType == null || border == null),
        super(key: key);

  final TextEditingController controller;
  final int maxLength;
  final int? borderType;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final double borderRadius;
  final FocusNode? focusNode;
  final bool isInputPwd;
  final InputBorder? border;
  final bool filled;
  final Color fillColor;
  final AppTheme theme;
  final Future<bool> Function()? getVCode;

  /// 用于集成测试寻找widget
  final String? keyName;

  InputBorder _buildInputBorder() {
    InputBorder border;
    switch (borderType) {
      case 1:
        border = UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.appColors.divider,
            width: 0.8,
          ),
        );
        break;
      case 2:
        border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.rpx),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 0.8,
          ),
        );
        break;
      default:
        border = InputBorder.none;
        break;
    }
    return border;
  }

  /// 倒计时秒数
  final int _second = 30;
  StreamSubscription? _subscription;

  Widget _buildShowDelete(ValueNotifier<bool> _isShowDelete) {
    return (_isShowDelete.value
        ? const MyIcon(
            FontAwesomeIcons.times,
            key: Key("_delete"),
          ).clickable(() {
            controller.text = '';
            _isShowDelete.value = false;
          })
        : const SizedBox.shrink());
  }

  Widget _buildShowPwd(ValueNotifier<bool> _isShowPwd) {
    if (isInputPwd) {
      return (_isShowPwd.value
              ? const MyIcon(
                  FontAwesomeIcons.eye,
                  key: Key("_show"),
                )
              : const MyIcon(
                  FontAwesomeIcons.eyeSlash,
                  key: Key("_show"),
                ))
          .clickable(() {
        _isShowPwd.value = !_isShowPwd.value;
      });
    } else {
      return const SizedBox.shrink();
    }
  }

  _buildGetCodeText(
      ValueNotifier<int> _currentSecond, ValueNotifier<int> _clickable) {
    if (_clickable.value == -1) {
      return "获取验证码";
    } else if (_clickable.value == 1) {
      return "重新发送";
    } else {
      return "（${_currentSecond.value} s）";
    }
  }

  Widget _buildGetCodeButton(ValueNotifier<int> _currentSecond,
      ValueNotifier<int> _clickable, VoidCallback _getVCode) {
    if (getVCode != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.rpx),
        child: MyButton(
          minHeight: 26.rpx,
          minWidth: 76.rpx,
          radius: 1.rpx,
          padding: EdgeInsets.symmetric(horizontal: 8.rpx),
          side: BorderSide(
            color: _clickable.value == 1
                ? theme.appColors.accent
                : Colors.transparent,
            width: 0.8.rpx,
          ),
          onPressed: _clickable.value == -1 || _clickable.value == 1
              ? _getVCode
              : null,
          text: _buildGetCodeText(_currentSecond, _clickable),
          textStyle: theme.textTheme.h30,
          theme: theme,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  List<Widget> buildSuffixIcon(
      ValueNotifier<bool> _isShowDelete,
      ValueNotifier<bool> _isShowPwd,
      ValueNotifier<int> _currentSecond,
      ValueNotifier<int> _clickable,
      VoidCallback _getVCode) {
    List<Widget> widgets = [];
    widgets.add(_buildShowDelete(_isShowDelete));
    widgets.add(_buildShowPwd(_isShowPwd));
    widgets.add(_buildGetCodeButton(_currentSecond, _clickable, _getVCode));
    return widgets;
  }

  Future _getVCode(_currentSecond, _clickable) async {
    final bool isSuccess = await getVCode!();
    if (isSuccess) {
      _currentSecond.value = _second;
      _clickable.value = 0;
      _subscription = Stream.periodic(const Duration(seconds: 1), (int i) => i)
          .take(_second)
          .listen((int i) {
        _currentSecond.value = _second - i - 1;
        _clickable.value = _currentSecond.value < 1 ? 1 : 0;
      });
    }
  }

  void cancel(VoidCallback isEmpty) {
    _subscription?.cancel();
    controller.removeListener(isEmpty);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isShowPwd = useState(false);
    final _isShowDelete = useState(false);
    final _clickable = useState(-1);

    /// 当前秒数
    final _currentSecond = useState(_second);

    useEffect(() {
      void isEmpty() {
        final bool isNotEmpty = controller.text.isNotEmpty;

        /// 状态不一样在刷新，避免重复不必要的setState
        if (isNotEmpty != _isShowDelete.value) {
          _isShowDelete.value = isNotEmpty;
        }
      }

      /// 获取初始化值
      _isShowDelete.value = controller.text.isNotEmpty;

      /// 监听输入改变
      controller.addListener(isEmpty);
      return () => cancel(isEmpty);
    }, []);

    Widget textField = TextField(
      focusNode: focusNode,
      maxLength: maxLength,
      obscureText: isInputPwd && !_isShowPwd.value,
      autofocus: autoFocus,
      controller: controller,
      textInputAction: TextInputAction.done,
      keyboardType: keyboardType,
      // 数字、手机号限制格式为0到9， 密码限制不包含汉字
      inputFormatters: (keyboardType == TextInputType.number ||
              keyboardType == TextInputType.phone)
          ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
          : [FilteringTextInputFormatter.deny(RegExp('[\u4e00-\u9fa5]'))],
      decoration: InputDecoration(
          contentPadding:
              borderType == 2 ? EdgeInsets.symmetric(horizontal: 15.rpx) : null,
          hintText: hintText,
          filled: filled,
          fillColor: fillColor,
          counterText: '',
          focusedBorder: border ?? _buildInputBorder(),
          enabledBorder: border ?? _buildInputBorder(),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: buildSuffixIcon(_isShowDelete, _isShowPwd, _currentSecond,
                _clickable, () => _getVCode(_currentSecond, _clickable)),
          )),
    );
    return textField;
  }
}
