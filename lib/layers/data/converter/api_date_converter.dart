import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class ApiDateConverter implements JsonConverter<DateTime, String> {
  const ApiDateConverter();

  static final _format = DateFormat("yyyy-MM-dd");

  @override
  DateTime fromJson(String json) {
    return _format.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return _format.format(object);
  }
}
