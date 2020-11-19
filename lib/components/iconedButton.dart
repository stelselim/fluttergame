import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yougame/classes/baseWidget.dart';
import 'package:yougame/utility/iconToParagraph.dart';

class IconedButton extends BaseWidget {
  final double xRatio;
  final double yRatio;
  final Icon icon; // Size, Style

  Paragraph paragraph;
  Offset position;

  IconedButton({this.icon, this.xRatio, this.yRatio}) {
    position = Offset(0, 0);
    paragraph =
        iconToParagraph(icon); // Makes Icon Drawable via Converting Paragraph
  }

  @override
  void onTapDown(TapDownDetails tapDownDetails, Function onPress) {
    var pos = tapDownDetails.globalPosition;
    if (pos.dx >= position.dx && pos.dx <= position.dx + icon.size) {
      if (pos.dy >= position.dy && pos.dy <= position.dy + icon.size) {
        onPress();
      }
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawParagraph(paragraph, position);
  }

  @override
  void resize(Size size) {
    position = Offset(
      size.width * xRatio - icon.size * xRatio,
      size.height * yRatio - icon.size * yRatio,
    );
  }

  @override
  void update() {}
}
