import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';

Future<void> setScreenSettings() async {
  final flameUtil = Util();
  await flameUtil.setOrientations([DeviceOrientation.portraitDown]);
  await flameUtil.fullScreen();
}
