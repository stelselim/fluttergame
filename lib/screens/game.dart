import 'package:flutter/material.dart';
import 'package:yougame/classes/baseScreen.dart';
import 'package:yougame/classes/screenstateEnum.dart';
import 'package:yougame/components/redsquare.dart';
import 'package:yougame/constants/paletteEntry.dart';
import 'dart:ui';

import 'package:yougame/main.dart';

class GameScreen extends BaseScreen {
  // Add Initial
  RedSquare redSquare = RedSquare();

  Size size = Size(0, 0);

  @override
  void onTapDown(TapDownDetails tapDownDetails) {
    redSquare?.onTapDown(tapDownDetails, () {});
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), green.paint);
    redSquare?.render(canvas);
  }

  @override
  void resize(Size size) {
    this.size = size;
    redSquare?.resize(size);
  }

  @override
  void update() {
    redSquare?.update();
  }
}
