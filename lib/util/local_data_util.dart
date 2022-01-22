import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const boxName = "app";
const userBoxName = "user_info";

void putString(String key, String value, {String defaultBoxName = boxName}) {
  Hive.box(defaultBoxName).put(key, value);
}

String getString(String key,
    {String defaultValue = "", String defaultBoxName = boxName}) {
  return Hive.box(defaultBoxName).get(key, defaultValue: defaultValue);
}

void putBool(String key, bool value, {String defaultBoxName = boxName}) {
  Hive.box(defaultBoxName).put(key, value);
}

bool getBool(String key, {String defaultBoxName = boxName}) {
  return Hive.box(defaultBoxName).get(key, defaultValue: false);
}

void putInt(String key, int value, {String defaultBoxName = boxName}) {
  Hive.box(defaultBoxName).put(key, value);
}

int getInt(String key,
    {int defaultValue = 0, String defaultBoxName = boxName}) {
  return Hive.box(defaultBoxName).get(key, defaultValue: defaultValue);
}

void putStringForUser(String key, String value) {
  Hive.box(userBoxName).put(key, value);
}

String getStringForUser(String key, {String defaultValue = ""}) {
  return Hive.box(userBoxName).get(key, defaultValue: defaultValue);
}

void putBoolForUser(String key, bool value) {
  Hive.box(userBoxName).put(key, value);
}

bool getBoolForUser(String key) {
  return Hive.box(userBoxName).get(key, defaultValue: false);
}


Future<void> initLocalData() async {
  await Hive.initFlutter();
  await Hive.openBox(boxName);
  await Hive.openBox(userBoxName);
}
