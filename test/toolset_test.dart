import 'package:flutter_test/flutter_test.dart';
import 'package:toolset/toolset.dart';

void main() {
  testList();
}

void testList() {
  test('asList', () {
    final dynamic object = [
      {'key': 'val1'},
      {'key': 'val2'}
    ];

    final converter = Converter(object);
    final list = converter.asList;
    final string = converter.asString;

    assert(list.length == 2, 'asList failed');
    assert(string.asList.length == 2, 'asString.asList failed');
    assert(string.isNotEmpty, 'asString failed');
    assert(list.isNotEmpty, 'asList.sString failed');
    assert(Converter(list.first).asString.asMap.isNotEmpty, 'failed');
    final values = list.enumerated((i, e) {
      return e['key'];
    });
    assert(values.length > 0, 'enumerated failed');

    final intList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    assert(intList.max == 10, 'max failed');
    assert(intList.min == 1, 'min failed');
    assert(intList.sum == 55, 'sum failed');
  });
}
