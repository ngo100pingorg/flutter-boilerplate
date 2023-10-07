import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:universal_file/universal_file.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('UniversalFile', () {
    test('test UniversalFile initialization', () async {
      final file = UniversalFile('test.txt');
      expect(file, isInstanceOf<UniversalFile>());
      expect(file.fileName, 'test.txt');
    });
  });
}
