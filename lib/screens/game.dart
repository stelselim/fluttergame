import 'package:flutter/material.dart';
import 'package:yougame/classes/baseScreen.dart';
import 'package:yougame/classes/screenstateEnum.dart';
import 'package:yougame/constants/paletteEntry.dart';
import 'dart:ui';

import 'package:yougame/main.dart';

class GameScreen extends BaseScreen {
  Size size = Size(0, 0);

  @override
  void onTapDown(TapDownDetails tapDownDetails) {
    screenState = ScreenState.kWelcomeScreen;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), green.paint);
  }

  @override
  void resize(Size size) {
    this.size = size;
  }

  @override
  void update() {
    // TODO: implement update
  }
}
