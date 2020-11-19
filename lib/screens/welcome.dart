import 'package:flutter/material.dart';
import 'package:yougame/classes/baseScreen.dart';
import 'dart:ui';

import 'package:yougame/classes/screenstateEnum.dart';
import 'package:yougame/components/iconedButton.dart';
import 'package:yougame/components/textedButton.dart';
import 'package:yougame/constants/paletteEntry.dart';
import 'package:yougame/main.dart';

class WelcomeScreen extends BaseScreen {
  // Variables
  TextedButton textedButton;
  IconedButton iconedButton;
  Size size;

  // Initiliaze in Constructor
  WelcomeScreen() {
    textedButton = TextedButton(text: "START", xRatio: 0.5, yRatio: 0.3);
    iconedButton = IconedButton(
        icon: Icon(Icons.bluetooth, size: 50), yRatio: 0.7, xRatio: 0.5);
    size = Size(0, 0);
  }

  @override
  void onTapDown(TapDownDetails tapDownDetails) {
    // Need to connect provider
    textedButton.onTapDown(tapDownDetails, () {
      screenState = ScreenState.kGameScreen;
    });
    iconedButton.onTapDown(tapDownDetails, () {
      screenState = ScreenState.kGameScreen;
    });
  }

  @override
  void render(Canvas canvas) {
    // Should be rendered first
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), blue.paint);
    textedButton?.render(canvas);
    iconedButton?.render(canvas);
  }

  @override
  void resize(Size size) {
    this.size = size; // set Size
    textedButton?.resize(size);
    iconedButton?.resize(size);
  }

  @override
  void update() {
    textedButton?.update();
    iconedButton?.update();
  }
}
