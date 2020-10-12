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

    assert(converter.asList.length == 2, 'asList failed');
    assert(converter.asString.asList.length == 2, 'asString.asList failed');
    assert(converter.asString.isNotEmpty, 'asString failed');
    assert(converter.asList.isNotEmpty, 'asList.sString failed');
    assert(
        Converter(converter.asList.asString.asList.first)
            .asString
            .asMap
            .isNotEmpty,
        'failed');
    final values = converter.asList.enumerated((i, e) {
      return e['key'];
    });
    assert(values.length > 0, 'enumerated failed');
    assert([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].max == 10, 'max failed');
    assert([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].min == 1, 'min failed');
    assert([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sum == 55, 'sum failed');
  });
}
