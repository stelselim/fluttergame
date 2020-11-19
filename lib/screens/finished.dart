import 'package:flutter/material.dart';
import 'package:yougame/MainApp.dart';
import 'package:yougame/classes/baseScreen.dart';
import 'package:yougame/classes/screenstateEnum.dart';
import 'package:yougame/components/textedButton.dart';
import 'package:yougame/constants/paletteEntry.dart';
import 'dart:ui';

class FinishedScreen extends BaseScreen {
  TextedButton textedButton;
  Size size = Size(0, 0);

  FinishedScreen() {
    textedButton = TextedButton(text: "RESTART", xRatio: 0.5, yRatio: 0.3);
  }

  @override
  void onTapDown(TapDownDetails tapDownDetails) {
    textedButton?.onTapDown(tapDownDetails, () {
      screenState = ScreenState.kWelcomeScreen;
    });
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), black.paint);
    textedButton?.render(canvas);
  }

  @override
  void resize(Size size) {
    this.size = size;
    textedButton?.resize(size);
  }

  @override
  void update() {
    textedButton?.update();
  }
}
