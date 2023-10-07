import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_file/src/web_file.dart';

const String fileName = 'test.txt';
const String fileContent = 'test content';

void main() {
  group('WebFile', () {
    test('test WebFile initialization', () async {
      final file = WebFile(fileName);
      expect(file, isInstanceOf<WebFile>());
      expect(file.fileName, fileName);
    });

    test('test reading from file', () async {
      SharedPreferences.setMockInitialValues({fileName: fileContent});
      final file = WebFile(fileName);
      final result = await file.read();
      expect(result, fileContent);
    });

    test('test reading non-existent file', () async {
      final file = WebFile('non_existent.txt');
      expect(() => file.read(), throwsA(isInstanceOf<Exception>()));
    });

    test('test writing to file', () async {
      final file = WebFile(fileName);
      await file.write(fileContent);
      final result = await SharedPreferences.getInstance().then((prefs) {
        return prefs.getString(fileName);
      });
      expect(result, fileContent);
    });

    test('test appending to file', () async {
      const String initialContent = 'initial content';
      const String appendedContent = 'appended content';
      SharedPreferences.setMockInitialValues({fileName: initialContent});
      final file = WebFile(fileName);
      await file.write(appendedContent, true);
      final result = await SharedPreferences.getInstance().then((prefs) {
        return prefs.getString(fileName);
      });
      expect(result, initialContent + appendedContent);
    });

    test('test WebFile initialization via Universal file', () async {
      // UniversalFile file = UniversalFile(fileName);
      // expect(file, isInstanceOf<WebFile>());
      // expect(file.fileName, fileName);

      final file = getPlatformFileWriter(fileName);
      expect(file, isInstanceOf<WebFile>());
      expect(file.fileName, fileName);
    });
  });
}
