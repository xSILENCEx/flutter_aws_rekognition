import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

class Sunglasses {
  const Sunglasses({
    required this.confidence,
    required this.value,
  });

  factory Sunglasses.fromJson(Map<String, dynamic> json) => Sunglasses(
        confidence: asT<double>(json['Confidence']),
        value: asT<bool>(json['Value']),
      );

  final double confidence;
  final bool value;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Confidence': confidence,
        'Value': value,
      };
}
