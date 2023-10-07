import 'package:flutter/material.dart';

class Console {
  static void printChunks(dynamic text) {
    final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(text.toString())
        .forEach((RegExpMatch match) => debugPrint(match.group(0)));
  }

  static void log(String text, [data]) {
    Console.printChunks(text);
    if (data != null) {
      Console.printChunks(data);
    }
  }

  static void info(String text, [data]) {
    Console.printChunks(text);
    if (data != null) {
      Console.printChunks(data);
    }
  }

  static void success(String text, [data]) {
    Console.printChunks(text);

    if (data != null) {
      Console.printChunks(data);
    }
  }

  static void warning(String text, [data]) {
    Console.printChunks(text);
    if (data != null) {
      Console.printChunks(data);
    }
  }

  static void danger(String text, [data]) {
    Console.printChunks(text);
    if (data != null) {
      Console.printChunks(data);
    }
  }
}
