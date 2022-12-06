import 'package:flutter_aws_rekognition/src/enums/gender_type.dart';
import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

class Gender {
  const Gender({
    required this.confidence,
    required this.value,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        confidence: asT<double>(json['Confidence']),
        value: asT<String>(json['Value']).gender,
      );

  final double confidence;
  final GenderType value;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Confidence': confidence,
        'Value': value.toStr,
      };
}
