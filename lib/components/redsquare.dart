import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:yougame/classes/baseWidget.dart';
import 'package:yougame/constants/borders.dart';

class RedSquare extends BaseWidget {
  // Color
  var redColor = PaletteEntry(Colors.red);

  /// Position Of Red Square
  double xPosition = 0;
  double yPosition = 0;

  // Size Of Red Square
  double width = 0;
  double height = 0;

  /// Speed & Direction
  double horizontalSpeed = 3;
  double horizontalSpeedSign = 1;

  // Screen Size
  Size size = Size(0, 0);

  // Find The Direction To Go
  calculateDirection() {
    if (xPosition < borderLeft) {
      horizontalSpeedSign = 1;
    } else if (xPosition >= size.width - width - borderRight) {
      horizontalSpeedSign = -1;
    }
  }

  // update Speed
  updateSpeed() {
    if (horizontalSpeed < 1) horizontalSpeed += 0.001;
  }

  // Calculate Position
  calculatePosition() {
    // Add Current Speed with Direction Sign (+) or (-)
    xPosition += horizontalSpeed * horizontalSpeedSign;
  }

  ///
  /// Must Override Functions From BaseWidget
  //
  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromLTWH(xPosition, yPosition, width, height), redColor.paint);
  }

  @override
  void resize(Size size) {
    this.size = size;

    // Aspect Ratio
    final ratio = size.height / size.width;
    width = size.width * 0.1 * ratio;
    height = size.height * 0.1;

    // Initial Positions
    xPosition = 15;
    // Screen Size - Its Own Size, Then Place it Middle
    yPosition = (size.height - height) / 2;
  }

  @override
  void onTapDown(TapDownDetails tapDownDetails, Function onPress) {
    var tapPosition = tapDownDetails.globalPosition;
    if (tapPosition.dx >= xPosition && tapPosition.dx < xPosition + width) {
      if (tapPosition.dy >= yPosition && tapPosition.dy < yPosition + height) {
        print("HEy Succes");

        if (redColor.color == Colors.red) {
          redColor = PaletteEntry(Colors.yellow);
        } else {
          redColor = PaletteEntry(Colors.red);
        }
        onPress();
      }
    }
  }

  @override
  void update() {
    updateSpeed();
    calculateDirection();
    calculatePosition();
  }
}
