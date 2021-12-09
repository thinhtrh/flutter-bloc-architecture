//
// @author thinhth on 12/02/2021
//
import 'package:logger/logger.dart';

class Loggers {
  static Logger logger = Logger(printer: PrettyPrinter());

  static void d(String message) {
    logger.d(message);
  }

  static void i(String message) {
    logger.i(message);
  }

  static void w(String message) {
    logger.w(message);
  }

  static void e(String message) {
    logger.e(message);
  }
}
