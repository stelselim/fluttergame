import 'package:flutter/material.dart';

abstract class BaseWidget {
  void render(Canvas canvas);

  void update();

  void resize(Size size);

  void onTapDown(TapDownDetails tapDownDetails, Function onPress);
}
