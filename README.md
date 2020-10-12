# toolset

Lightweight extension for basic dart syntax utility including data, string and iterator.

## Getting Started

```dart
final dynamic object = [
  {'key1': 'val1'},
  {'key2': 'val2'}
];

final converter = Converter(object);

assert(converter.asList.length == 2, 'asList failed');
assert(converter.asString.asList.length == 2, 'asString.asList failed');
assert(converter.asString.isNotEmpty, 'asString failed');
assert(converter.asList.isNotEmpty, 'asList.sString failed');
assert(Converter(converter.asList.asString.asList.first)
        .asString
        .asMap
        .isNotEmpty, 'failed');
assert(converter.asList.enumerated((i, e) { return [e]; }).length > 0, 'enumerated failed');
assert([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].max == 10, 'max failed');
assert([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].min == 1, 'min failed');
assert([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sum == 55, 'sum failed');
```