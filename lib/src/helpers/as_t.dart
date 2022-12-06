import 'dart:convert';
export 'dart:convert';

/// Map<String, dynamic>
typedef SDMap = Map<String, dynamic>;

/// 转换为 SDMap
SDMap asMap(dynamic value) {
  if (value == null) {
    return <String, dynamic>{};
  }

  return asT<SDMap>(value);
}

T asT<T>(dynamic value, [T? def]) {
  if (value is T) {
    return value;
  }
  if (T == String) {
    return (def ?? '') as T;
  }
  if (T == bool) {
    return (def ?? false) as T;
  }
  if (T == int) {
    return (def ?? 0) as T;
  }
  if (T == double) {
    return (def ?? 0.0) as T;
  }

  if (<String, String>{} is T) {
    if (value is String && value.isNotEmpty) {
      return json.decode(value) as T;
    }
    return (def ?? <String, String>{}) as T;
  }

  if (<String, dynamic>{} is T) {
    if (value is String) {
      return json.decode(value) as T;
    }

    return (def ?? <String, dynamic>{}) as T;
  }

  if (<dynamic, dynamic>{} is T) {
    if (value is String) {
      return json.decode(value) as T;
    }
    return (def ?? <dynamic, dynamic>{}) as T;
  }

  return def as T;
}
