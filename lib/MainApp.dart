import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yougame/classes/baseScreen.dart';
import 'package:yougame/classes/screenstateEnum.dart';
import 'package:yougame/screens/finished.dart';
import 'package:yougame/screens/game.dart';
import 'package:yougame/screens/welcome.dart';

ScreenState screenState = ScreenState.kWelcomeScreen;

class MainApp extends Game with TapDetector {
  // Screen State to Decide Where The App is in

  BaseScreen _gameScreen; // Screens
  BaseScreen _welcomeScreen; // Screens
  BaseScreen _finishedScreen;

  // Decides Screen with Screen State Enum
  BaseScreen getActiveScreen() {
    switch (screenState) {
      case ScreenState.kWelcomeScreen:
        return _welcomeScreen;
      case ScreenState.kGameScreen:
        return _gameScreen;
      case ScreenState.kFinishScreen:
        return _finishedScreen;

      default:
        return _welcomeScreen;
    }
  }

  // Constructor
  MainApp() {
    // Initialize First Page
    screenState = ScreenState.kWelcomeScreen;

    // Initialize Screens
    _welcomeScreen = WelcomeScreen();
    _gameScreen = GameScreen();
    _finishedScreen = FinishedScreen();
  }

  @override
  void render(Canvas canvas) {
    getActiveScreen()?.render(canvas);
  }

  @override
  void update(double t) {
    getActiveScreen()?.update();
  }

  @override
  void resize(Size size) {
    _welcomeScreen?.resize(size);
    _gameScreen?.resize(size);
    _finishedScreen?.resize(size);
  }

  @override
  void onTapDown(TapDownDetails tapDownDetails) {
    getActiveScreen()?.onTapDown(tapDownDetails);
  }
}
