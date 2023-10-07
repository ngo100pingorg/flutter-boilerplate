import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:universal_file/universal_file.dart';

class IoFile implements UniversalFile {
  late Directory dataPath;
  bool _hasDataPath = false;

  @override
  String fileName;

  IoFile(this.fileName);

  String get fullPath => p.join(dataPath.path, fileName);

  Future getDataPath() async {
    if (_hasDataPath) return;
    _hasDataPath = true;
    String supportDir = (await getApplicationSupportDirectory()).path;
    dataPath = Directory(supportDir);
    await createDirIfNotExists(dataPath);
  }

  @override
  Future<String> read() async {
    await getDataPath();
    return await File(fullPath).readAsString();
  }

  @override
  Future write(String value, [bool append = false]) async {
    await getDataPath();
    await File(fullPath).writeAsString(
      value,
      mode: append ? FileMode.append : FileMode.write,
    );
  }

  static Future<void> createDirIfNotExists(Directory dir) async {
    //Create directory if it doesn't exist
    if (!await dir.exists()) {
      //Catch error since disk io can always fail.
      try {
        await dir.create(recursive: true);
      } catch (e) {
        rethrow;
      }
    }
  }
}

UniversalFile getPlatformFileWriter(String string) => IoFile(string);
