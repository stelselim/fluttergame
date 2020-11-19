import 'package:yougame/classes/baseWidget.dart';
import 'package:flutter/material.dart';

class TextedButton extends BaseWidget {
  final double xRatio;
  final double yRatio;
  final String text;

  Offset position;

  TextStyle textStyle;
  TextPainter textPainter;

  TextedButton({this.text, this.xRatio, this.yRatio}) {
    // Initialize
    position = Offset(0, 0);
    textStyle = TextStyle(color: Colors.white, fontSize: 0);
    textPainter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);

    textPainter.text = TextSpan(text: text, style: textStyle);
    textPainter.layout();
  }

  @override
  void onTapDown(TapDownDetails tapDownDetails, Function onPress) {
    var pos = tapDownDetails.globalPosition;
    if (pos.dx >= position.dx && pos.dx <= position.dx + textPainter.width) {
      if (pos.dy >= position.dy && pos.dy <= position.dy + textPainter.height)
        onPress();
    }
  }

  @override
  void render(Canvas canvas) {
    textPainter.paint(canvas, position);
  }

  @override
  void resize(Size size) {
    textStyle = TextStyle(
      color: Colors.white,
      fontSize: size.width * 0.1,
      backgroundColor: Colors.black,
    );

    textPainter.text = TextSpan(text: text, style: textStyle);
    textPainter.layout();

    position = Offset(
      size.width * xRatio - textPainter.width * xRatio,
      size.height * yRatio - textPainter.height * yRatio,
    );
  }

  @override
  void update() {}
}
