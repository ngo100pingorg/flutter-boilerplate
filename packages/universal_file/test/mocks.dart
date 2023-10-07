import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_file/src/web_file.dart';

export 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

const path = './test/fixtures/core';

MockDirectory mockDirectory = MockDirectory(path);

class MockDirectory extends Mock implements Directory {
  final String _path;

  MockDirectory(this._path);

  @override
  String get path => _path;

  @override
  Future<bool> exists() async {
    return false;
  }

  @override
  Future<Directory> create({bool recursive = false}) {
    throw Exception("Error");
  }
}

class MockPathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getApplicationSupportPath() async => path;
}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockWebFile extends Mock implements WebFile {}
