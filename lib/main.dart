import 'package:flutter/material.dart';
import 'package:yougame/MainApp.dart';
import 'package:yougame/utility/setScreenSettings.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fullscreen & Other Utils
    setScreenSettings();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            MainApp().widget,
          ],
        ),
      ),
    );
  }

  Widget myWidget() {
    return Positioned(
      top: 200,
      left: 150,
      child: Container(
        width: 50,
        height: 100,
        color: Colors.teal,
        child: Text("Hello!"),
      ),
    );
  }
}
