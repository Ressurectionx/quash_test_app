import 'package:flutter/material.dart';
import 'package:quash_test/view/quash_board.dart';
import 'package:quash_watch/quash_watch.dart';

void main() {
  QuashWatch quash = QuashWatch();

  FlutterError.onError = (FlutterErrorDetails details) async {
    await quash.handleErrors();
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}
