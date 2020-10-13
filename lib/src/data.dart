import 'dart:convert';

import 'converter.dart';

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
    return jsonDecode(this) as Map<String, dynamic>;
  }

  List<dynamic> get asList {
    return jsonDecode(this) as List<dynamic>;
  }
}
