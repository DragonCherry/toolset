library toolset;

import 'dart:convert';
import 'dart:core';
import 'dart:math' as math;

class Converter {
  final dynamic object;

  Converter(this.object);

  List<dynamic> asList(final dynamic object) {
    final result = List<dynamic>();
    final iterator = object as Iterable;
    if (iterator != null) {
      iterator.forEach((element) {
        result.add(element);
      });
    }
    return result;
  }

  String asString(final dynamic object) {
    return jsonEncode(object);
  }

  dynamic asJson(final dynamic object) {
    return jsonDecode(object);
  }
}

extension DoubleIterable on Iterable<double> {
  num get max => reduce(math.max);
  num get min => reduce(math.min);
  num get sum => reduce((value, element) => value + element);
}

extension Enumeratable<E> on Iterable<E> {
  Iterable<T> enumerated<T>(T f(E e, int i)) {
    var i = 0;
    return this.map((e) => f(e, i++));
  }
}
