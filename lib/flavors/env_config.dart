import 'package:logger/logger.dart';

class EnvConfig {
  final String appName;
  final String baseUrl;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 120,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
      ),
    );
  }
}
