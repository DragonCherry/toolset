import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:toolset/toolset.dart';

void main() {
  testList();
}

void testList() {
  test('asList', () {
    final dynamic object = [
      {'key1': 'val1'},
      {'key2': 'val2'}
    ];

    try {
      log(Converter(object).asList(object).toString());
    } catch (e) {
      log(e.toString());
    }
  });
}
