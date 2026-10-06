import 'dart:io';

import 'package:test/test.dart';
import 'package:syzygy_ai_flutter/syzygy_ai_flutter.dart';

void main() {
  test('kSyzygyAIVersion matches pubspec.yaml version', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final match =
        RegExp(r'^version:\s*(\S+)', multiLine: true).firstMatch(pubspec);
    expect(match, isNotNull);
    expect(kSyzygyAIVersion, match!.group(1));
  });
}
