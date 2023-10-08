import 'dart:async';

import 'package:intl/intl.dart';
import 'package:universal_file/universal_file.dart';

import 'console_log.dart';

class LocalLog {
  static bool _isWriting = false;
  static bool _initialized = false;

  static late UniversalFile _infoFile;
  static late UniversalFile _successFile;
  static late UniversalFile _warningFile;
  static late UniversalFile _errorFile;

  static Future<void> init() async {
    if (_initialized) return;
    _initialized = true;
    _infoFile = UniversalFile("info-log.txt");
    _successFile = UniversalFile("success-log.txt");
    _warningFile = UniversalFile("warning-log.txt");
    _errorFile = UniversalFile("error-log.txt");
  }

  static void info(
    String value, [
    bool writeTimestamp = true,
  ]) {
    init().then(
      (_) {
        writeFile(_infoFile, true, value, writeTimestamp);
      },
    );
  }

  static void success(
    String value, [
    bool writeTimestamp = true,
  ]) {
    init().then((_) {
      writeFile(_successFile, true, value, writeTimestamp);
    });
  }

  static void warning(
    String value, [
    bool writeTimestamp = true,
  ]) {
    init().then(
      (_) {
        writeFile(_warningFile, true, value, writeTimestamp);
      },
    );
  }

  static void danger(String error,
      {StackTrace? stack, bool writeTimestamp = true}) {
    init().then(
      (_) {
        writeFile(
          _errorFile,
          true,
          "[ERROR] $error\n${stack?.toString()}",
          writeTimestamp,
        );
      },
    );
  }

  static String _formatLine(
    String value,
    bool writeTimestamp,
  ) {
    String date = writeTimestamp
        ? DateFormat("EEE MMM d @ H:m:s").format(DateTime.now())
        : "";
    return "$date: $value \n";
  }

  static Future writeFile(
    UniversalFile file,
    bool append,
    String value,
    bool writeTimestamp,
  ) async {
    if (_isWriting) {
      Timer.periodic(const Duration(milliseconds: 10), (timer) {
        if (!_isWriting) {
          timer.cancel();
          writeFile(file, append, value, writeTimestamp);
        }
      });
      return;
    } else {
      try {
        _isWriting = true;
        await file.write(_formatLine(value, writeTimestamp), append);
        _isWriting = false;
      } catch (e) {
        _isWriting = false;
        Console.danger(e.toString());
      }
      return;
    }
  }
}
