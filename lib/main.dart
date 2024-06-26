import 'package:flutter/material.dart';
import 'package:quash_watch/quash_watch.dart';

import 'view/quash_board.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized

  QuashWatch quash = QuashWatch();
  quash.handleErrors(); // Set up error handling

  // Run the app by starting with the root widget (MyApp)
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
