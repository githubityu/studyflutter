import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_login_data.freezed.dart';

part 'new_login_data.g.dart';

@freezed
class NewLoginData with _$NewLoginData {
  factory NewLoginData({
    @JsonKey(name: 'user_id') String? useId,
    String? phone,
    String? name,
    String? token,
    String? logo,
    String? gender,
    String? isall,
  }) = _NewLoginData;

  factory NewLoginData.fromJson(Map<String, dynamic> json) =>
      _$NewLoginDataFromJson(json);
}
