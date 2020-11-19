import 'dart:async';

import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:yougame/MainApp.dart';
import 'package:yougame/classes/baseWidget.dart';
import 'package:yougame/classes/screenstateEnum.dart';
import 'package:yougame/constants/borders.dart';

class RedSquare extends BaseWidget {
  bool _isGameOver = false;

  // Color
  var redColor = PaletteEntry(Colors.red);

  /// Position Of Red Square
  double xPosition = 0;
  double yPosition = 0;

  // Size Of Red Square
  double width = 0;
  double height = 0;

  /// Speed & Direction
  double horizontalSpeed = 5;
  double horizontalSpeedSign = 1;

  double verticalSpeed = 0;
  double verticalSpeedSign = 1;

  // Screen Size
  Size size = Size(0, 0);

  refreshGame() {
    _isGameOver = false;

    // Initial Position
    xPosition = 15;
    yPosition = size.height * 0.5;

    /// Speed & Direction
    horizontalSpeed = 5;
    horizontalSpeedSign = 1;
    verticalSpeed = 0;
    verticalSpeedSign = 1;
  }

  bool isSafeY() {
    if (yPosition > height * 2 && yPosition <= size.height - height * 2) {
      return true;
    } else {
      return false;
    }
  }

  bool isSafeX() {
    if (xPosition > width * 2 && xPosition <= size.width - width * 2) {
      return true;
    } else {
      return false;
    }
  }

  bool isGameOver() {
    return _isGameOver;
  }

  // Find The Direction To Go
  changeDirection() {
    if (!isSafeX()) {
      horizontalSpeedSign *= -1;
    }
    if (!isSafeY()) {
      verticalSpeedSign *= -1;
    }
  }

  // update Speed
  updateSpeed() {
    if (horizontalSpeed < 10) horizontalSpeed += 0.001;

    if (horizontalSpeed > 5.25) {
      verticalSpeed = 3;
    }

    if (verticalSpeed > 2) {
      verticalSpeed += 0.005;
    }
  }

  // Calculate Position
  calculatePosition() {
    // Add Current Speed with Direction Sign (+) or (-)
    xPosition += horizontalSpeed * horizontalSpeedSign;
    yPosition += verticalSpeed * verticalSpeedSign;

    if (xPosition <= -5 ||
        xPosition >= size.width - width + 5 ||
        yPosition <= -5 ||
        yPosition >= size.height - height + 5) {
      _isGameOver = true;
    }
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
    changeDirection();
  }

  @override
  void update() {
    if (!_isGameOver) {
      updateSpeed();
      calculatePosition();
      if (isGameOver()) {
        new Timer(Duration(milliseconds: 400), () {
          print("You Lost");
          screenState = ScreenState.kFinishScreen;
          refreshGame();
        });
      }
    }
  }
}
