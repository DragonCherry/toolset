import 'dart:convert';
import 'dart:core';

class Converter<T> {
  final dynamic object;

  Converter(this.object);

  List<T> get asList {
    final result = List<T>();
    final iterator = object as Iterable<T>;
    if (iterator != null) {
      iterator.forEach((element) {
        result.add(element);
      });
    }
    return result;
  }

  String get asString {
    return jsonEncode(object);
  }

  dynamic get asJson {
    return jsonDecode(object);
  }
}

extension IterableToolset<T> on Iterable<T> {
  Iterable<E> enumerated<E>(E f(int i, T e)) {
    var i = 0;
    final result = <E>[];
    forEach((element) {
      result.add(f(i++, element));
    });
    return result;
  }

  void indexedEach<E>(E f(int i, T e)) {
    var i = 0;
    forEach((element) {
      f(i++, element);
    });
  }

  Iterable<T> filter(bool f(T item)) {
    final result = List<T>();
    forEach((e) {
      if (e != null && f(e)) {
        result.add(e);
      }
    });
    return result;
  }
}

extension MapToolset on Map<String, dynamic> {
  String get asString {
    return Converter(this).asString;
  }
}

extension ListToolset on List<dynamic> {
  String get asString {
    return Converter(this).asString;
  }
}

extension StringToolset on String {
  Map<String, dynamic> get asMap {
    return jsonEncode(this) as Map<String, dynamic>;
  }

  List<dynamic> get asList {
    return jsonEncode(this) as List<dynamic>;
  }
}

extension IterableNumberToolset on Iterable<num> {
  num get max {
    num biggest;
    forEach((element) {
      if (biggest == null) {
        biggest = element;
      } else {
        if (element > biggest) {
          biggest = element;
        }
      }
    });
    return biggest;
  }

  num get min {
    num smallest;
    forEach((element) {
      if (smallest == null) {
        smallest = element;
      } else {
        if (element < smallest) {
          smallest = element;
        }
      }
    });
    return smallest;
  }

  num get sum {
    num summation = 0;
    forEach((element) {
      if (summation == null) {
        summation = element;
      } else {
        summation += element;
      }
    });
    return summation;
  }
}
