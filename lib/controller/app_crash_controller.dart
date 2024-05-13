import 'dart:math';
import 'package:quash_watch/quash_watch.dart';

class AppCrashController {
  final QuashWatch quashWatch = QuashWatch();

  void throwRandomException() {
    final exceptions = [
      Exception('This is a random exception!'),
      ArgumentError('Wrong argument provided!'),
      UnsupportedError('This feature is not supported!'),
    ];
    final randomIndex = Random().nextInt(exceptions.length);
    throw exceptions[randomIndex];
  }

  Future<List<LogEntry>> loadErrorLogsAsCrashData() async {
    return await quashWatch.loadErrorLogsAsCrashData();
  }
}
