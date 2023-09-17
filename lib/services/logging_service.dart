import 'dart:developer' as developer;
import 'package:logging/logging.dart';

class LoggingService {
  LoggingService._();

  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      developer.log('[${record.level.name}] ${record.time}: ${record.message}');
    });
  }

  static Logger getLogger(String className) {
    return Logger(className);
  }
}
