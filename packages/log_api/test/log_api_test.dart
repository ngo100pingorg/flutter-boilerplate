import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:log_api/log_api.dart';
import 'package:log_api/src/local_log.dart';
import 'package:mockito/mockito.dart';
import 'package:universal_file/universal_file.dart';

const path = './test/fixtures/core';

class MockUniversalFile extends Mock implements UniversalFile {
  @override
  Future write(String value, [bool append = false]) async {
    value;
  }
}

class ErrorMockUniversalFile extends Mock implements UniversalFile {
  @override
  Future write(String value, [bool append = false]) async {
    throw Exception();
  }
}

void main() {
  group('Log', () {
    const String text = 'text';
    const Map<String, dynamic> data = {
      'key_one': 0.0,
      'key_two': 'value',
      'key_three': true,
    };
    MockUniversalFile file = MockUniversalFile();

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      LocalLog.initForTest(file);
    });

    test('Log: Set configuration', () {
      Log.setConfiguration(
        enableConsoleLog: true,
        enableLocalLog: true,
      );
    });

    test('Log: log', () {
      Log.log(text, data: data);
    });

    test('Log: info', () {
      Log.info(text, data: data);
    });

    test('Log: success', () {
      Log.success(text, data: data);
    });

    test('Log: warning', () {
      Log.warning(text, data: data);
    });

    test('Log: danger', () {
      Log.danger(text, data: StackTrace.empty);
    });

    test('Log: writting multiple logs simultaneously', () {
      try {
        for (var i = 0; i < 100; i++) {
          Log.log(i.toString(), enableConsoleLogArg: false);
        }
      } catch (e) {
        fail(e.toString());
      }
    });
  });

  group('Log', () {
    const String text = 'text';
    ErrorMockUniversalFile efile = ErrorMockUniversalFile();

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      LocalLog.initForTest(efile);
    });

    test('Log: Set configuration', () {
      Log.setConfiguration(
        enableConsoleLog: true,
        enableLocalLog: true,
      );
    });

    test('Log: handle write exception', () {
      Log.log(text);
    });
  });
}
