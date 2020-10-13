import 'dart:core';

extension IterableToolset<T> on Iterable<T> {
  Iterable<E> enumerated<E>(E f(int i, T e)) {
    var i = 0;
    final result = <E>[];
    forEach((element) {
      result.add(f(i++, element));
    });
    return result;
  }

  void indexedEach(f(int i, T e)) {
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
