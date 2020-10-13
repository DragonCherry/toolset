import 'dart:convert';

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
