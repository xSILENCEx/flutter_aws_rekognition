import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

class AgeRange {
  const AgeRange({
    required this.high,
    required this.low,
  });

  factory AgeRange.fromJson(Map<String, dynamic> json) => AgeRange(
        high: asT<int>(json['High']),
        low: asT<int>(json['Low']),
      );

  final int high;
  final int low;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'High': high,
        'Low': low,
      };
}
