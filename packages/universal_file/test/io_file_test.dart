import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:universal_file/src/io_file.dart';
import 'package:universal_file/universal_file.dart';
import 'mocks.dart';

const String fileName = 'test.txt';
const String fileContent = 'test content';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('IoFile', () {
    late MockPathProviderPlatform mockPathProviderPlatform;

    late IoFile file;

    setUp(() async {
      mockPathProviderPlatform = MockPathProviderPlatform();
      PathProviderPlatform.instance = mockPathProviderPlatform;

      file = IoFile(fileName);
    });

    test('test IoFile initialization', () async {
      final file = IoFile(fileName);
      expect(file, isInstanceOf<IoFile>());
      expect(file.fileName, fileName);
    });

    test('Create new directory if not exist', () async {
      file.write(fileContent);
      expect(file, isNotNull);
    });

    test('test write file', () async {
      await file.write(fileContent);
      expect(file, isNotNull);
    });

    test('test read file', () async {
      String result = await file.read();
      expect(result, equals(fileContent));
    });

    // catch exception for createDirIfNotExists method
    test('test createDirIfNotExists exception', () async {
      try {
        await IoFile.createDirIfNotExists(mockDirectory);
        fail('Expected an exception, but none was thrown.');
      } catch (e) {
        expect(e, isInstanceOf<Exception>());
      }
    });

    test('test IoFile initialization via Universal file', () async {
      UniversalFile file;

      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      file = UniversalFile(fileName);
      expect(file, isInstanceOf<IoFile>());
      expect(file.fileName, fileName);

      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      file = UniversalFile(fileName);
      expect(file, isInstanceOf<IoFile>());
      expect(file.fileName, fileName);
    });
  });
}
